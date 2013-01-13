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

nodist__core_la_SOURCES = \
	src/cangjie/_core.cpp \
	$(NULL)
_core_la_CXXFLAGS = $(LIBCANGJIE_CFLAGS) $(PYTHON_INCLUDE)
_core_la_LDFLAGS = -avoid-version -module
_core_la_LIBADD = $(LIBCANGJIE_LIBS)

nodist_languages_la_SOURCES = \
	src/cangjie/languages.cpp \
	$(NULL)
languages_la_CXXFLAGS = $(LIBCANGJIE_CFLAGS) $(PYTHON_INCLUDE)
languages_la_LDFLAGS = -avoid-version -module
languages_la_LIBADD = $(LIBCANGJIE_LIBS)

nodist_versions_la_SOURCES = \
	src/cangjie/versions.cpp \
	$(NULL)
versions_la_CXXFLAGS = $(LIBCANGJIE_CFLAGS) $(PYTHON_INCLUDE)
versions_la_LDFLAGS = -avoid-version -module
versions_la_LIBADD = $(LIBCANGJIE_LIBS)

pkgpyexecdir = $(pyexecdir)/cangjie

src/cangjie/_core.cpp: src/cangjie/_core.pyx src/cangjie/_core.pxd
	$(MKDIR_P) src/cangjie
	$(CYTHON) --cplus -3 --verbose -o $@ $(srcdir)/src/cangjie/_core.pyx

src/cangjie/languages.cpp: src/cangjie/languages.pyx src/cangjie/_core.pxd
	$(MKDIR_P) src/cangjie
	$(CYTHON) --cplus -3 --verbose -o $@ $(srcdir)/src/cangjie/languages.pyx

src/cangjie/versions.cpp: src/cangjie/versions.pyx src/cangjie/_core.pxd
	$(MKDIR_P) src/cangjie
	$(CYTHON) --cplus -3 --verbose -o $@ $(srcdir)/src/cangjie/versions.pyx

# -- Common --------------------------
CLEANFILES = \
	src/cangjie/_core.cpp \
	src/cangjie/languages.cpp \
	src/cangjie/versions.cpp \
	$(NULL)

EXTRA_DIST = \
	autogen.sh \
	src/cangjie/_core.pyx \
	src/cangjie/_core.pxd \
	src/cangjie/languages.pyx \
	src/cangjie/versions.pyx \
	$(NULL)

TESTS = \
	$(NULL)
