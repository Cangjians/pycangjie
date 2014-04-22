AC_PREREQ(2.63)
AC_INIT([pycangjie], [1.2], [https://github.com/Cangjians/pycangjie/issues], [cangjie], [https://github.com/Cangjians/pycangjie])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE([1.11 no-dist-gzip dist-xz tar-ustar foreign])
AC_PROG_MKDIR_P

m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])

# Initialize libtool
LT_INIT([disable-static])

# Check for libcangjie
PKG_CHECK_MODULES(LIBCANGJIE, [cangjie >= 1.0])

# Check for Python 3
AM_PATH_PYTHON([3.2.3])
AC_PATH_PROGS([PYTHON_CONFIG],
              [python$PYTHON_VERSION-config python-config],
              [no],
              [`dirname $PYTHON`])
AS_IF([test "$PYTHON_CONFIG" = no], [AC_MSG_ERROR([cannot find python-config for $PYTHON.])])
AC_MSG_CHECKING([python include flags])
PYTHON_INCLUDE=`$PYTHON_CONFIG --includes`
AC_MSG_RESULT([$PYTHON_INCLUDE])
AC_SUBST(PYTHON_INCLUDE)

# Check for Cython presence
AC_PATH_PROGS([CYTHON],
              [cython3 cython],
              [no])
AS_IF([test "$CYTHON" = no], [AC_MSG_ERROR([cannot find cython.])])

# Check for Cython version
CYTHON_MIN_VERSION=0.14
AC_MSG_CHECKING(for cython version)
CYTHON_VERSION=`$CYTHON --version 2>&1 | cut -d" " -f3`
AC_MSG_RESULT($CYTHON_VERSION)
$PYTHON -c "from distutils.version import StrictVersion as ver; import sys; sys.exit(0 if ver(\"$CYTHON_VERSION\") >= ver(\"$CYTHON_MIN_VERSION\") else 1)"
AS_IF([test $? = 1], [AC_MSG_ERROR([Please use cython >= $CYTHON_MIN_VERSION])])

AC_SUBST(CYTHON)

# OUTPUT files
AC_CONFIG_FILES([
  Makefile
])

AC_OUTPUT
