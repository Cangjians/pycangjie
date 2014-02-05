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


import unittest

import cangjie
from tests import BaseTestCase, MetaTest


class VersionThreeBig5HKSCSTestCase(BaseTestCase, metaclass=MetaTest):
    cli_options = ["--filter=big5,hkscs", "--mode=code", "--cj-version=3"]
    version = cangjie.versions.CANGJIE3
    language = cangjie.filters.BIG5 | cangjie.filters.HKSCS
