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


from libc.stdint cimport uint32_t


cdef extern from "cangjie.h":
    cdef enum CangjieVersion:
        CANGJIE_VERSION_3
        CANGJIE_VERSION_5


    cdef enum CangjieFilter:
        CANGJIE_FILTER_BIG5
        CANGJIE_FILTER_HKSCS
        CANGJIE_FILTER_PUNCTUATION
        CANGJIE_FILTER_CHINESE
        CANGJIE_FILTER_ZHUYIN
        CANGJIE_FILTER_KANJI
        CANGJIE_FILTER_KATAKANA
        CANGJIE_FILTER_HIRAGANA
        CANGJIE_FILTER_SYMBOLS


    cdef int CANGJIE_OK
    cdef int CANGJIE_NOCHARS
    cdef int CANGJIE_DBOPEN
    cdef int CANGJIE_DBERROR
    cdef int CANGJIE_NOMEM
    cdef int CANGJIE_INVALID


    cdef struct CCangjieChar "CangjieChar":
        char     chchar[5]
        char     code[6]
        uint32_t frequency

    int cangjie_char_new(CCangjieChar **c,
                         char          *chchar,
                         char          *code,
                         uint32_t       frequency)

    int cangjie_char_free(CCangjieChar *c)


    cdef struct CCangjieCharList "CangjieCharList":
        CCangjieChar     *c
        CCangjieCharList *prev
        CCangjieCharList *next

    int cangjie_char_list_free(CCangjieCharList *l)


    cdef struct CCangjie "Cangjie":
        uint32_t version
        uint32_t filter_flags

    int cangjie_new(CCangjie       **cj,
                    CangjieVersion   version,
                    CangjieFilter    filter_flags)

    int cangjie_get_characters(CCangjie         *cj,
                               char              *code,
                               CCangjieCharList **l)

    int cangjie_get_characters_by_shortcode(CCangjie         *cj,
                                            char              *code,
                                            CCangjieCharList **l)

    int cangjie_get_radical(CCangjie    *cj,
                            char   key,
                            char **radical)

    int cangjie_is_input_key(CCangjie   *cj,
                             char  key)

    int cangjie_free(CCangjie *cj)
