# Copyright (c) 2013 - The pycangjie authors
#
# This file is part of pycangjie, the Python bindings to libcangjie.
#
# pycangjie is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# pycangjie is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with pycangjie.  If not, see <http://www.gnu.org/licenses/>.


import itertools
import operator
import string
import subprocess
import unittest

import cangjie


class MetaTest(type):
    """Metaclass for our test cases

    The goal is to provide every TestCase class with methods like test_a(),
    test_b(), etc..., in other words, one method per potential Cangjie input
    code.

    Well, not quite, because that would be 12356630 methods (the number of
    strings composed of 1 to 5 lowercase ascii letters), and even though my
    laptop has 8Go of RAM, the test process gets killed by the OOM killer. :)

    So we cheat, and use libcangjie's wildcard support, so that we only
    generate 26 + 26^2 = 702 methods.
    """
    def __init__(cls, name, bases, dct):
        super(MetaTest, cls).__init__(name, bases, dct)

        def gen_codes():
            """Generate the 702 possible input codes"""
            # First, the 1-character codes
            for c in string.ascii_lowercase:
                yield c

            # Next, the 2-characters-with-wildcard codes
            for t in itertools.product(string.ascii_lowercase, repeat=2):
                yield '*'.join(t)

        def tester(code):
            def func(cls):
                return cls.run_test(code)
            return func

        # Generate the test_* methods
        for code in gen_codes():
            setattr(cls, "test_%s" % code.replace("*", ""), tester(code))


class BaseTestCase(unittest.TestCase):
    """Base test class, grouping the common stuff for all our unit tests"""
    def __init__(self, name):
        super().__init__(name)

        self.cli_cmd = ["/usr/bin/libcangjie_cli"] + self.cli_options

        self.language = (cangjie.filters.BIG5 | cangjie.filters.HKSCS |
                         cangjie.filters.PUNCTUATION |
                         cangjie.filters.CHINESE |
                         cangjie.filters.ZHUYIN | cangjie.filters.KANJI |
                         cangjie.filters.KATAKANA |
                         cangjie.filters.HIRAGANA |
                         cangjie.filters.SYMBOLS)

    def setUp(self):
        self.cj = cangjie.Cangjie(self.version, self.language)

    def tearDown(self):
        del self.cj

    def run_command(self, cmd):
        """Run a command, deal with errors, and return its stdout"""
        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        out, err = proc.communicate()

        try:
            cangjie.errors.handle_error_code(proc.returncode,
                                             msg="Unknown error while running"
                                                 " libcangjie_cli (%d)"
                                                 % proc.returncode)

        except cangjie.errors.CangjieNoCharsError:
            return ""

        try:
            return out.decode("utf-8")

        except UnicodeDecodeError:
            # Python's 'utf-8' codec trips over b"\xed\xa1\x9d\xed\xbc\xb2",
            # but according to [1] and [2], it is a valid sequence of 2 chars:
            #     U+D85D    \xed\xa1\x9d
            #     U+DF32    \xed\xbc\xb2
            # [1] http://www.utf8-chartable.de/unicode-utf8-table.pl?start=55389&utf8=string-literal
            # [2] http://www.utf8-chartable.de/unicode-utf8-table.pl?start=57138&utf8=string-literal
            # TODO: Investigate this further, and eventually open a bug report
            out2 = []
            for line in out.split("\n".encode("utf-8")):
                try:
                    out2.append(line.decode("utf-8"))
                except UnicodeDecodeError:
                    pass
            return "\n".join(out2)

    def run_test(self, input_code):
        """Run the actual test

        This compares the output of the libcangjie_cli tool with the output
        from pycangjie.

        The idea is that if pycangjie produces the same results as a C++ tool
        compiled against libcangjie, then pycangjie properly wraps libcangjie.

        We do not try to verify that pycangjie produces valid results here,
        validity is to be checked in libcangjie.

        Note that this whole test is based on scraping the output of
        libcangjie_cli, which is quite fragile.
        """
        # Get a list of CangjieChar from libcangjie_cli as a reference
        tmp_expected = self.run_command(self.cli_cmd+[input_code]).split("\n")
        tmp_expected = map(lambda x: x.strip(" \n"), tmp_expected)
        tmp_expected = filter(lambda x: len(x) > 0, tmp_expected)

        expected = []
        for item in tmp_expected:
            chchar, code, frequency = item.split(", ")

            chchar = chchar.split(" ")[-1]
            code = code.split(" ")[-1].strip("'")
            frequency = int(frequency.split(" ")[-1])

            expected.append(cangjie._core.CangjieChar(chchar.encode("utf-8"),
                                                      code.encode("utf-8"),
                                                      frequency))

        expected = sorted(expected, key=operator.attrgetter('chchar', 'code'))

        try:
            # And compare with what pycangjie produces
            results = sorted(self.cj.get_characters(input_code),
                             key=operator.attrgetter('chchar', 'code'))

            self.assertEqual(results, expected)

        except cangjie.errors.CangjieNoCharsError:
            self.assertEqual(len(expected), 0)
