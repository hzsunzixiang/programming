#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([TexasServer], [2.0.0.0], [])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_CONFIG_HEADERS([config.h])

AC_PREFIX_DEFAULT(..)

# Checks for programs.
:${CXXFLAGS=""}
AC_PROG_CXX
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_RANLIB
AM_PROG_AR



# Checks for header files.
AC_CHECK_HEADERS([stdint.h stdlib.h string.h unistd.h])


# Checks for typedefs, structures, and compiler characteristics.
#AC_CHECK_HEADER_STDBOOL
AC_C_INLINE


# Checks for library functions.
AC_FUNC_ALLOCA
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([gethostbyname strerror])

AC_CONFIG_FILES([Makefile
				module/Makefile
				])
AC_OUTPUT
