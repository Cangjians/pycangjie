from libc.stdint cimport uint32_t
from libcpp.string cimport string
from libcpp.vector cimport vector


cdef extern from "cangjie.h":
    ctypedef enum CangJie_Version_Type:
        CangJie_Version_Type_3
        CangJie_Version_Type_5

    cppclass CppCangJie "CangJie":
        CppCangJie(CangJie_Version_Type, uint32_t)
        vector[string] getCharacters(string)
