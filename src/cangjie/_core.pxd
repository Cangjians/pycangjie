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

from libc.stdint cimport uint32_t
from libcpp cimport bool
from libcpp.string cimport string
from libcpp.vector cimport vector


cdef extern from "cangjie.h":
    ctypedef enum:
        CANGJIE_SIMPLIFIED  = 0x00000001
        CANGJIE_TRADITIONAL = 0x00000010
        CANGJIE_COMMON      = 0x00000011
        CANGJIE_ALL_CJK     = 0x00000111

    ctypedef enum CangJie_Version_Type:
        CangJie_Version_Type_3
        CangJie_Version_Type_5

    cppclass CppCangJie "CangJie":
        CppCangJie(CangJie_Version_Type, uint32_t)
        vector[string] getCharacters(string)
        bool isCangJieInputKey(char c)
