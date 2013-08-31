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

#from cython.operator cimport preincrement as inc, dereference as deref

cimport _core


cdef class CangjieChar:
    cdef _core.CCangjieChar *cobj

    def __cinit__(self, char *chchar, char *code, uint32_t frequency):
        ret = <int>_core.cangjie_char_new(&self.cobj, chchar, code,
                                          frequency)
        if ret != 0:
            raise MemoryError('Could not allocate memory for a CangjieChar')

    @property
    def chchar(self):
        return self.cobj.chchar.decode("utf-8")

    @property
    def code(self):
        return self.cobj.code.decode("utf-8")

    @property
    def frequency(self):
        return self.cobj.frequency

    def __dealloc__(self):
        if self.cobj is not NULL:
            _core.cangjie_char_free(self.cobj)


cdef class Cangjie:
    cdef _core.CCangjie *cobj

    def __cinit__(self, _core.CangjieVersion version,
                  _core.CangjieFilter filter_flags):
        """Constructor for the Cangjie class

        The `version` parameter must be one of the available constants in
        the `cangjie.versions` module.

        The `filter_flags` parameter must be a bitwise-AND of one or more of
        the available constants in the `cangjie.filters` module.
        """
        ret = <int>_core.cangjie_new(&self.cobj, version, filter_flags)
        if ret != 0:
            raise MemoryError('Could not allocate memory for a Cangjie')

    @property
    def filter_flags(self):
        return self.cobj.filter_flags

    @property
    def version(self):
        return self.cobj.version

    def __dealloc__(self):
        if self.cobj is not NULL:
            _core.cangjie_free(self.cobj)
