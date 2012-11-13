# Copyright (c) 2012 - The pycangjie authors
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

cimport cangjie


# Make the version constants available in the Python module
VERSION_3 = cangjie.CangJie_Version_Type_3
VERSION_5 = cangjie.CangJie_Version_Type_5


# Make the class available in the Python module
cdef class CangJie:
    cdef cangjie.CppCangJie* cobj

    def __init__(self, cangjie.CangJie_Version_Type version, uint32_t flags):
        self.cobj = new cangjie.CppCangJie(version, flags)
        if self.cobj == NULL:
            raise MemoryError('Not enough memory.')

    def getCharacters(self, string code):
        return self.cobj.getCharacters(code)
