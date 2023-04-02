#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([count_words], [0.1], [haichengsun123@163.com])
AC_CONFIG_SRCDIR([src/count_words.c])
AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE([-Wall -Werror foreign])

# Checks for programs.
AC_PROG_CC
AC_PROG_LEX
AC_PROG_INSTALL
AC_PROG_RANLIB
AM_PROG_AR
AM_PROG_CC_C_O

# Checks for libraries.
# FIXME: Replace `main' with a function in `-lfl':
AC_CHECK_LIB([fl], [main])

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h])

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile
		         src/Makefile
				 common/Makefile
				 include/Makefile])
AC_OUTPUT

