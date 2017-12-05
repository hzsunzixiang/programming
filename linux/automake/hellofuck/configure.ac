#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

#AC_PREREQ(2.57)
AC_INIT(hellofuck, 1.0, mij@bitchx.it)
#AM_INIT_AUTOMAKE(hellofuck, 1.0)
#AM_INIT_AUTOMAKE
#https://stackoverflow.com/questions/21773003/error-in-automake
#Makefile.am: error: required file './NEWS' not found
#Probably adding foreign to AM_INIT_AUTOMAKE macro in configure.ac could be helpful in this case.
AM_INIT_AUTOMAKE([-Wall -Werror foreign])

AC_CONFIG_SRCDIR([src/fuck.c])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([stdlib.h unistd.h])

AC_CONFIG_HEADERS([config.h])
# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([sqrt])
AC_OUTPUT(Makefile doc/Makefile man/Makefile script/Makefile src/Makefile)
