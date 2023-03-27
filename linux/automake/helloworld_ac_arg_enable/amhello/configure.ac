# Copyright (C) 2006-2014 Free Software Foundation, Inc.
# This configure.ac script is free software; the Free Software Foundation
# gives unlimited permission to copy, distribute and modify it.

AC_INIT([amhello], [1.0], [bug-automake@gnu.org])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC
AC_CONFIG_HEADERS([config.h])

# --with-python[=DIR]     build Python bindings if found
# AC_ARG_WITH(python, [  --with-python[[=DIR]]     build Python bindings if found])
# CXX 是 C++的
# AC_ARG_ENABLE(debug, [ --enable-debug turn on debug], CXXFLAGS="$CXXFLAGS -g3 -D_DEBUG=1")
AC_ARG_ENABLE(debug, [ --enable-debug turn on debug], CFLAGS="$CFLAGS -g3 -D_DEBUG=1")


AC_CONFIG_FILES([
 Makefile
 src/Makefile
])
AC_OUTPUT
