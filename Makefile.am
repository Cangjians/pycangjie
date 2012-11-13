# Point to our macro directory and pick up user flags from the environment
ACLOCAL_AMFLAGS  = -I m4 ${ACLOCAL_FLAGS}

# -- src/ ----------------------------
pyexec_LTLIBRARIES = cangjie.la
cangjie_la_SOURCES = \
	src/cangjie.cpp \
	$(NULL)
cangjie_la_CXXFLAGS = $(LIBCANGJIE_CFLAGS) $(PYTHON_INCLUDE)
cangjie_la_LDFLAGS = -avoid-version -module
cangjie_la_LIBADD = $(LIBCANGJIE_LIBS)
cangjie_pyexecdir = $(pyexecdir)

src/cangjie.cpp: src/cangjie.pyx src/cangjie.pxd
	cython --cplus --verbose src/cangjie.pyx

# -- Common --------------------------
CLEANFILES = \
	src/cangjie.cpp \
	$(NULL)

EXTRA_DIST = \
	autogen.sh \
	$(NULL)

TESTS = \
	$(NULL)
