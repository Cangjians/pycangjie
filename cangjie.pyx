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
