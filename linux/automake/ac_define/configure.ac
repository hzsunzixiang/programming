#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([ac_define], [1.0], [bug-automake@gnu.org])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])

AC_PROG_CC
AC_CONFIG_HEADERS([config.h])

#AC_DEFINE(HELLO)

AC_DEFINE(VERSION, "5.6")

myvar="foo"
othervar="bar"
#AC_DEFINE_UNQUOTED(TEST, "${myvar}${othervar}")

# Checks for programs.

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([
 Makefile
 src/Makefile
])

AC_OUTPUT
