# Copyright (C) 2006-2014 Free Software Foundation, Inc.
# This configure.ac script is free software; the Free Software Foundation
# gives unlimited permission to copy, distribute and modify it.

AC_INIT([amhello], [1.0], [bug-automake@gnu.org])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC

#AC_CONFIG_HEADERS([config.h])
# 这里指定config.h的名字及路径
AC_CONFIG_HEADERS([src/config/bitcoin-config.h])


######define CLIENT_VERSION_MAJOR 0
define(_CLIENT_VERSION_MAJOR, 0)
AC_DEFINE(CLIENT_VERSION_MAJOR, _CLIENT_VERSION_MAJOR, [Major version])

# Check for daemon(3), unrelated to --with-daemon (although used by it)
AC_CHECK_DECLS([daemon])


AC_CHECK_DECLS([le16toh, le32toh, le64toh, htole16, htole32, htole64, be16toh, be32toh, be64toh, htobe16, htobe32, htobe64],,,
		[#if HAVE_ENDIAN_H
                 #include <endian.h>
                 #elif HAVE_SYS_ENDIAN_H
                 #include <sys/endian.h>
                 #endif])

AC_CHECK_HEADERS([endian.h sys/endian.h byteswap.h stdio.h stdlib.h unistd.h strings.h sys/types.h sys/stat.h sys/select.h sys/prctl.h])


AC_CONFIG_FILES([
 Makefile
 src/Makefile
])
AC_OUTPUT
