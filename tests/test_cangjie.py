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
