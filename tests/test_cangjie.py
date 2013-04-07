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
# You should have received a copy of the GNU General Public License
# along with pycangjie.  If not, see <http://www.gnu.org/licenses/>.


import unittest

import cangjie
from tests import BaseTestCase, MetaTest


class VersionFiveAllCjkTestCase(BaseTestCase, unittest.TestCase,
                                metaclass=MetaTest):
    # For now, this is the only scenario we can test, as we rely on the
    # libcangjie_cli tool, and it only implmeents this
    # FIXME: Improve libcangjie_cli so we can cover other cases
    version = cangjie.versions.CANGJIE5
    language = cangjie.languages.ALL_CJK
    code_len = 1
