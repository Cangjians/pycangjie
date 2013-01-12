AC_PREREQ(2.63)
AC_INIT([pycangjie], [0.0.1], [https://github.com/bochecha/pycangjie/issues], [pycangjie], [https://github.com/bochecha/pycangjie])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE([1.11 no-dist-gzip dist-xz tar-ustar foreign])
AC_PROG_MKDIR_P

m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])

# Needed to build C++ and check for deps
AC_PROG_CXX
AC_LANG_PUSH([C++])

# Initialize libtool
LT_INIT([disable-static])

# Check for libcangjie
PKG_CHECK_MODULES(LIBCANGJIE, [cangjie])

AC_LANG_POP([C++])

# Check for Cython
AC_PATH_PROGS([CYTHON],
              [cython3 cython],
              [no])
AS_IF([test "$CYTHON" = no], [AC_MSG_ERROR([cannot find cython.])])
AC_SUBST(CYTHON)

# Check for Python 3
AM_PATH_PYTHON([3.3])
AC_PATH_PROGS([PYTHON_CONFIG],
              [python$PYTHON_VERSION-config python-config],
              [no],
              [`dirname $PYTHON`])
AS_IF([test "$PYTHON_CONFIG" = no], [AC_MSG_ERROR([cannot find python-config for $PYTHON.])])
AC_MSG_CHECKING([python include flags])
PYTHON_INCLUDE=`$PYTHON_CONFIG --includes`
AC_MSG_RESULT([$PYTHON_INCLUDE])
AC_SUBST(PYTHON_INCLUDE)

# OUTPUT files
AC_CONFIG_FILES([
  Makefile
])

AC_OUTPUT
