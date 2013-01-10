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

cimport _core


# Make the class available in the Python module
cdef class CangJie:
    cdef _core.CppCangJie* cobj

    def __init__(self, _core.CangJie_Version_Type version, uint32_t flags):
        """Constructor for the CangJie class

        The `version` parameter must be one of the available constants in
        the `cangjie.versions` module.

        The `flags` parameter must be one of the available constants in
        the `cangjie.languages` module.
        """
        self.cobj = new _core.CppCangJie(version, flags)
        if self.cobj == NULL:
            raise MemoryError('Not enough memory.')

    def getCharacters(self, unicode code):
        """Return the CJK characters corresponding to the `code`

        The `code` parameter must be a unicode string.
        """
        cdef string c_code = code.encode("utf-8")
        return map(lambda x: x.decode("utf-8"),
                   self.cobj.getCharacters(c_code))

    def isCangJieInputKey(self, unicode c):
        """Return whether the input `c` is a valid CangJie char"""
        cdef char c_c = ord(c.encode("utf-8"))
        return self.cobj.isCangJieInputKey(c_c)

    def translateInputKeyToCangJie(self, unicode c):
        """Return the CangJie representation (radical) of an input char."""
        cdef char c_c = ord(c.encode("utf-8"))
        return self.cobj.translateInputKeyToCangJie(c_c).decode("utf-8")