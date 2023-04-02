# Copyright (C) 2006-2014 Free Software Foundation, Inc.
# This configure.ac script is free software; the Free Software Foundation
# gives unlimited permission to copy, distribute and modify it.

AC_INIT([amhello], [1.0], [bug-automake@gnu.org])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([
 Makefile
 src/Makefile
])


dnl Checks for programs.
AC_PROG_AWK
AC_PROG_GREP
AC_PROG_EGREP
AC_PROG_FGREP
AC_PROG_INSTALL
AC_PROG_MKDIR_P
AC_PROG_LEX
AC_PROG_LN_S
AC_PROG_RANLIB
AC_PROG_SED
AC_PROG_YACC

dnl Checks for library functions.
AC_FUNC_ALLOCA
AC_FUNC_CHOWN
AC_FUNC_CLOSEDIR_VOID
AC_FUNC_ERROR_AT_LINE

#AC_FUNC_FNMATCH
#AC_FUNC_FNMATCH_GNU
AC_FUNC_FORK
AC_FUNC_FSEEKO
AC_FUNC_GETGROUPS
#AC_FUNC_GETLOADAVG
AC_FUNC_GETMNTENT
AC_FUNC_GETPGRP
AC_FUNC_LSTAT_FOLLOWS_SLASHED_SYMLINK
AC_FUNC_MALLOC
AC_FUNC_MBRTOWC
AC_FUNC_MEMCMP
AC_FUNC_MKTIME
AC_FUNC_MMAP
AC_FUNC_OBSTACK
AC_FUNC_REALLOC
AC_FUNC_SELECT_ARGTYPES

#AC_USE_SYSTEM_EXTENSIONS
AC_FUNC_SETPGRP
AC_FUNC_STAT
AC_FUNC_LSTAT
AC_FUNC_STRCOLL
AC_FUNC_STRERROR_R
AC_FUNC_STRFTIME
AC_FUNC_STRTOD
AC_FUNC_STRTOLD
#AC_FUNC_STRNLEN
AC_FUNC_UTIME_NULL
AC_FUNC_VPRINTF
AC_REPLACE_FNMATCH

dnl Checks for library functions.
AC_CHECK_FUNCS([ \
  accept4 \
  arc4random \
  arc4random_buf \
  clock_gettime \
  eventfd \
  epoll_create1 \
  fcntl \
  getegid \
  geteuid \
  getifaddrs \
  getnameinfo \
  getprotobynumber \
  gettimeofday \
  inet_ntop \
  inet_pton \
  issetugid \
  mach_absolute_time \
  mmap \
  nanosleep \
  pipe \
  pipe2 \
  putenv \
  sendfile \
  setenv \
  setrlimit \
  sigaction \
  signal \
  splice \
  strlcpy \
  strsep \
  strtok_r \
  strtoll \
  sysctl \
  timerfd_create \
  umask \
  unsetenv \
  usleep \
  vasprintf \
  getservbyname \
])

dnl Checks for header files.
AC_CHECK_HEADER_STDBOOL
AC_HEADER_ASSERT
AC_HEADER_DIRENT
AC_HEADER_MAJOR
AC_HEADER_RESOLV
AC_HEADER_STAT
AC_HEADER_STDBOOL
AC_HEADER_STDC
AC_HEADER_SYS_WAIT
AC_HEADER_TIME
AC_HEADER_TIOCGWINSZ
dnl Checks for header files.
AC_CHECK_HEADERS([ \
  arpa/inet.h \
  fcntl.h \
  ifaddrs.h \
  mach/mach_time.h \
  netdb.h \
  netinet/in.h \
  netinet/in6.h \
  netinet/tcp.h \
  poll.h \
  port.h \
  stdarg.h \
  stddef.h \
  sys/devpoll.h \
  sys/epoll.h \
  sys/event.h \
  sys/eventfd.h \
  sys/ioctl.h \
  sys/mman.h \
  sys/param.h \
  sys/queue.h \
  sys/resource.h \
  sys/select.h \
  sys/sendfile.h \
  sys/socket.h \
  sys/stat.h \
  sys/time.h \
  sys/timerfd.h \
  sys/uio.h \
  sys/wait.h \
  errno.h \
])



# Generic Structure Checks
AC_STRUCT_DIRENT_D_INO  
AC_STRUCT_DIRENT_D_TYPE  
AC_STRUCT_ST_BLOCKS  
AC_STRUCT_TM  
AC_STRUCT_TIMEZONE  

AC_CHECK_MEMBERS([struct in6_addr.s6_addr32, struct in6_addr.s6_addr16, struct sockaddr_in.sin_len, struct sockaddr_in6.sin6_len, struct sockaddr_storage.ss_family, struct sockaddr_storage.__ss_family], , ,
[#include <sys/types.h>
#ifdef HAVE_NETINET_IN_H
#include <netinet/in.h>
#endif
#ifdef HAVE_NETINET_IN6_H
#include <netinet/in6.h>
#endif
#ifdef HAVE_SYS_SOCKET_H
#include <sys/socket.h>
#endif
#ifdef _WIN32
#define WIN32_WINNT 0x400
#define _WIN32_WINNT 0x400
#define WIN32_LEAN_AND_MEAN
#if defined(_MSC_VER) && (_MSC_VER < 1300)
#include <winsock.h>
#else
#include <winsock2.h>
#include <ws2tcpip.h>
#endif
#endif
])


# Type Checks

AC_TYPE_INT8_T 
AC_TYPE_INT16_T 
AC_TYPE_INT32_T 
AC_TYPE_INT64_T 
AC_TYPE_INTMAX_T 
AC_TYPE_INTPTR_T 
AC_TYPE_LONG_DOUBLE 
AC_TYPE_LONG_DOUBLE_WIDER 
AC_TYPE_LONG_LONG_INT 
AC_TYPE_MBSTATE_T 
AC_TYPE_MODE_T 
AC_TYPE_OFF_T 
AC_TYPE_PID_T 
AC_TYPE_SIZE_T 
AC_TYPE_SSIZE_T 
AC_TYPE_UID_T 
AC_TYPE_UINT8_T 
AC_TYPE_UINT16_T 
AC_TYPE_UINT32_T 
AC_TYPE_UINT64_T 
AC_TYPE_UINTMAX_T 
AC_TYPE_UINTPTR_T 
AC_TYPE_UNSIGNED_LONG_LONG_INT

AC_CHECK_TYPES([struct in6_addr, struct sockaddr_in6, sa_family_t, struct addrinfo, struct sockaddr_storage], , ,
[#define _GNU_SOURCE
#include <sys/types.h>
#ifdef HAVE_NETINET_IN_H
#include <netinet/in.h>
#endif
#ifdef HAVE_NETINET_IN6_H
#include <netinet/in6.h>
#endif
#ifdef HAVE_SYS_SOCKET_H
#include <sys/socket.h>
#endif
#ifdef HAVE_NETDB_H
#include <netdb.h>
#endif
#ifdef _WIN32
#define WIN32_WINNT 0x400
#define _WIN32_WINNT 0x400
#define WIN32_LEAN_AND_MEAN
#if defined(_MSC_VER) && (_MSC_VER < 1300)
#include <winsock.h>
#else
#include <winsock2.h>
#include <ws2tcpip.h>
#endif
#endif
])

#Generic Compiler Characteristics

AC_CHECK_SIZEOF(long long)
AC_CHECK_SIZEOF(long)
AC_CHECK_SIZEOF(int)
AC_CHECK_SIZEOF(short)
AC_CHECK_SIZEOF(size_t)
AC_CHECK_SIZEOF(void *)
AC_CHECK_SIZEOF(off_t)

AC_CHECK_ALIGNOF
AC_COMPUTE_INT
AC_LANG_WERROR
AC_OPENMP

# C Compiler Characteristics
AC_PROG_CC_C_O
AC_PROG_CPP
AC_PROG_CPP_WERROR
AC_PROG_CC_STDC
AC_PROG_CC_C89
AC_PROG_CC_C99
AC_C_BACKSLASH_A
AC_C_BIGENDIAN 
AC_C_CONST
AC_C_RESTRICT
AC_C_VOLATILE
AC_C_INLINE
AC_C_CHAR_UNSIGNED
AC_C_STRINGIZE
AC_C_FLEXIBLE_ARRAY_MEMBER
AC_C_VARARRAYS
AC_C_TYPEOF
AC_C_PROTOTYPES
AC_PROG_GCC_TRADITIONAL










AC_OUTPUT






















