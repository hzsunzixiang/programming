# Copyright (C) 2006-2014 Free Software Foundation, Inc.
# This configure.ac script is free software; the Free Software Foundation
# gives unlimited permission to copy, distribute and modify it.

AC_INIT([amhello], [1.0], [bug-automake@gnu.org])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])

#If using the GNU C compiler, set shell variable GCC to ‘yes’. If output variable CFLAGS was not already set, set it to -g -O2 for the GNU C compiler (-O2 on systems where GCC does not accept -g), or -g for other compilers. If your package does not like this default, then it is acceptable to insert the line ‘: ${CFLAGS=""}’ after AC_INIT and before AC_PROG_CC to select an empty default instead. 
:${CFLAGS=""}
AC_PROG_CC
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([
 Makefile
 src/Makefile
])


dnl Checks for programs.
AC_PROG_AWK

AC_OUTPUT






















