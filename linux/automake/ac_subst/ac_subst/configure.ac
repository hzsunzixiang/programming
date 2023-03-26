# Copyright (C) 2006-2014 Free Software Foundation, Inc.
# This configure.ac script is free software; the Free Software Foundation
# gives unlimited permission to copy, distribute and modify it.

AC_INIT([amhello], [1.0], [bug-automake@gnu.org])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC
AC_CONFIG_HEADERS([config.h])

# 在这里定义变量
AC_SUBST([PERCENT_SIGN],[%])

# If you are using Automake 1.11 or newer, for newlines in values you might want to consider using AM_SUBST_NOTMAKE to prevent automake from adding a line variable = @variable@ to the Makefile.in files (see Automake).
# https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Setting-Output-Variables.html

AM_SUBST_NOTMAKE ([EXCLAMATION_SIGN],[!])

AC_CONFIG_FILES([
 Makefile
 src/Makefile
])
AC_OUTPUT
