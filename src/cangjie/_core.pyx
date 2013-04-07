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
# You should have received a copy of the GNU General Public License
# along with pycangjie.  If not, see <http://www.gnu.org/licenses/>.

from cython.operator cimport preincrement as inc, dereference as deref

cimport _core


cdef class ChChar:
    cdef _core.CppChChar* cobj

    def __cinit__(self, string chchar, uint32_t type, uint32_t order):
        # There seems to be a bug in Python, where it doesn't know some valid
        # UTF-8 sequences (see the unit tests for an example of it).
        # So let's try here first, so that we fail earlier rather than later,
        # in weird ways which would be painful to debug.
        chchar.decode("utf-8")

        self.cobj = new _core.CppChChar(chchar, type, order)
        if self.cobj == NULL:
            raise MemoryError('Not enough memory.')

    def __dealloc__(self):
        if self.cobj is not NULL:
            del self.cobj

    @property
    def chchar(self):
        return self.cobj.chchar().decode("utf-8")

    def get_code(self):
        return self.cobj.code().decode("utf-8")
    def set_code(self, string code):
        self.cobj.set_code(code)
    code = property(get_code, set_code)

    def get_frequency(self):
        return self.cobj.frequency()
    def set_frequency(self, uint32_t frequency):
        self.cobj.set_frequency(frequency)
    frequency = property(get_frequency, set_frequency)

    def get_classic_frequency(self):
        return self.cobj.classic_frequency()
    def set_classic_frequency(self, uint32_t frequency):
        self.cobj.set_classic_frequency(frequency)
    classic_frequency = property(get_classic_frequency, set_classic_frequency)

    @property
    def type(self):
        return self.cobj.type()

    def __str__(self):
        return ("<ChChar code='%s', chchar='%s', frequency='%s',"
                " classic_frequency='%s', type='%s'>"
                % (self.code, self.chchar, self.frequency,
                   self.classic_frequency, self.type))

    def __richcmp__(self, other, op):
        equality = (self.code == other.code
                and self.chchar == other.chchar
                and self.frequency == other.frequency
                and self.classic_frequency == other.classic_frequency
                and self.type == other.type)

        if op == 2:
            return equality

        if op == 3:
            return not equality

        raise NotImplementedError("Only (in)equality is implemented")


cdef class CangJie:
    cdef _core.CppCangJie* cobj

    def __cinit__(self, _core.CangJie_Version_Type version, uint32_t flags):
        """Constructor for the CangJie class

        The `version` parameter must be one of the available constants in
        the `cangjie.versions` module.

        The `flags` parameter must be one of the available constants in
        the `cangjie.languages` module.
        """
        self.cobj = new _core.CppCangJie(version, flags)
        if self.cobj == NULL:
            raise MemoryError('Not enough memory.')

    def __dealloc__(self):
        if self.cobj is not NULL:
            del self.cobj

    cdef __iterate_chars(self, vector[CppChChar] v):
        cdef CppChChar *cppchchar_ptr
        cdef vector[CppChChar].iterator iter = v.begin()
        cdef vector[CppChChar].iterator end = v.end()

        result = []

        while iter < end:
            cppchchar_ptr = &deref(iter)

            try:
                chchar = ChChar(cppchchar_ptr.chchar(), cppchchar_ptr.type(),
                                cppchchar_ptr.order())
                chchar.set_code(cppchchar_ptr.code())
                chchar.set_frequency(cppchchar_ptr.frequency())
                chchar.set_classic_frequency(cppchchar_ptr.classic_frequency())
                result.append(chchar)

            except UnicodeDecodeError:
                # Python's UTF-8 codec doesn't like this chchar :(
                pass

            inc(iter)

        return result

    def getCharacters(self, str code):
        """Return the CJK characters corresponding to the `code`"""
        cdef string c_code = code.encode("utf-8")
        cdef vector[CppChChar] v = self.cobj.getCharacters(c_code)
        return self.__iterate_chars(v)

    def isCangJieInputKey(self, str c):
        """Return whether the input `c` is a valid CangJie char"""
        cdef char c_c = ord(c.encode("utf-8"))
        return self.cobj.isCangJieInputKey(c_c)

    def translateInputKeyToCangJie(self, str c):
        """Return the CangJie representation (radical) of an input char"""
        cdef char c_c = ord(c.encode("utf-8"))
        return self.cobj.translateInputKeyToCangJie(c_c).decode("utf-8")

    def getFullWidthChar(self, str c):
        """Return the full-width version of a character"""
        cdef char c_c = ord(c.encode("utf-8"))
        return self.cobj.getFullWidthChar(c_c).decode("utf-8")
