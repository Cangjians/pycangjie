# Point to our macro directory and pick up user flags from the environment
ACLOCAL_AMFLAGS  = -I m4 ${ACLOCAL_FLAGS}

# -- src/ ----------------------------
cangjie_PYTHON = \
	src/cangjie/__init__.py \
	$(NULL)
cangjiedir = $(pkgpyexecdir)

pkgpyexec_LTLIBRARIES = \
	_core.la \
	languages.la \
	versions.la \
	$(NULL)

_core_la_SOURCES = \
	src/cangjie/_core.cpp \
	$(NULL)
_core_la_CXXFLAGS = $(LIBCANGJIE_CFLAGS) $(PYTHON_INCLUDE)
_core_la_LDFLAGS = -avoid-version -module
_core_la_LIBADD = $(LIBCANGJIE_LIBS)

languages_la_SOURCES = \
	src/cangjie/languages.cpp \
	$(NULL)
languages_la_CXXFLAGS = $(LIBCANGJIE_CFLAGS) $(PYTHON_INCLUDE)
languages_la_LDFLAGS = -avoid-version -module
languages_la_LIBADD = $(LIBCANGJIE_LIBS)

versions_la_SOURCES = \
	src/cangjie/versions.cpp \
	$(NULL)
versions_la_CXXFLAGS = $(LIBCANGJIE_CFLAGS) $(PYTHON_INCLUDE)
versions_la_LDFLAGS = -avoid-version -module
versions_la_LIBADD = $(LIBCANGJIE_LIBS)

pkgpyexecdir = $(pyexecdir)/cangjie

src/cangjie/_core.cpp: src/cangjie/_core.pyx src/cangjie/_core.pxd
	cython --cplus -3 --verbose src/cangjie/_core.pyx

src/cangjie/languages.cpp: src/cangjie/languages.pyx src/cangjie/_core.pxd
	cython --cplus -3 --verbose src/cangjie/languages.pyx

src/cangjie/versions.cpp: src/cangjie/versions.pyx src/cangjie/_core.pxd
	cython --cplus -3 --verbose src/cangjie/versions.pyx

# -- Common --------------------------
CLEANFILES = \
	src/cangjie/_core.cpp \
	src/cangjie/languages.cpp \
	src/cangjie/versions.cpp \
	$(NULL)

EXTRA_DIST = \
	autogen.sh \
	$(NULL)

TESTS = \
	$(NULL)
