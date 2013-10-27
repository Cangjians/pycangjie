# Copyright (c) 2012-2013 - The pycangjie authors
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

cimport _core


# Make the version constants available in the Python module
CANGJIE3 = _core.CANGJIE_VERSION_3
CANGJIE5 = _core.CANGJIE_VERSION_5
