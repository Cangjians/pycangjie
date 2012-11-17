# Point to our macro directory and pick up user flags from the environment
ACLOCAL_AMFLAGS  = -I m4 ${ACLOCAL_FLAGS}

# -- src/ ----------------------------
cangjie_PYTHON = \
	src/cangjie/__init__.py \
	$(NULL)
cangjiedir = $(pkgpyexecdir)

pkgpyexec_LTLIBRARIES = \
	_core.la \
	$(NULL)

_core_la_SOURCES = \
	src/cangjie/_core.cpp \
	$(NULL)
_core_la_CXXFLAGS = $(LIBCANGJIE_CFLAGS) $(PYTHON_INCLUDE)
_core_la_LDFLAGS = -avoid-version -module
_core_la_LIBADD = $(LIBCANGJIE_LIBS)

pkgpyexecdir = $(pyexecdir)/cangjie

src/cangjie/_core.cpp: src/cangjie/_core.pyx src/cangjie/_core.pxd
	cython --cplus --verbose src/cangjie/_core.pyx

# -- Common --------------------------
CLEANFILES = \
	src/cangjie/_core.cpp \
	$(NULL)

EXTRA_DIST = \
	autogen.sh \
	$(NULL)

TESTS = \
	$(NULL)
