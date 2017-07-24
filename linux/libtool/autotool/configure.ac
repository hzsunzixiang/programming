#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([libcompress], [1.0.0.1], [haichengsun123@163.com])
# 初始话 Automake 
#Probably adding foreign to AM_INIT_AUTOMAKE macro in configure.ac could be helpful in this case.

# 下面这行新版本 有问题   老版本可能是正常的
# 是foreign 在起作用
#AM_INIT_AUTOMAKE([-Wall]) 
#AM_INIT_AUTOMAKE([Framework], [0.0.1]) 

#$ automake --add-missing
#Makefile.am: error: required file './NEWS' not found
#Makefile.am: error: required file './README' not found
#Makefile.am: error: required file './AUTHORS' not found
#Makefile.am: error: required file './ChangeLog' not found

# 使用下面这个才能自动生成这些文件
#AM_INIT_AUTOMAKE([-Wall -Werror foreign])  
AM_INIT_AUTOMAKE([-Wall -Werror foreign])  

# 这是在 Autoconf 中使用 Libtool 唯一必须的宏
AC_CONFIG_SRCDIR([main.c])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CC

AM_PROG_AR
#Makefile.am: error: required file './NEWS' not found
#Makefile.am: error: required file './README' not found
#Makefile.am: error: required file './AUTHORS' not found
#Makefile.am: error: required file './ChangeLog' not found
#Makefile.am: installing './COPYING' using GNU General Public License v3 file
#Makefile.am:     Consider adding the COPYING file to the version control system
#Makefile.am:     for your code, to avoid questions about which license your project uses
#/usr/share/automake-1.14/am/ltlibrary.am: warning: 'libcompress.la': linking libtool libraries using a non-POSIX
#/usr/share/automake-1.14/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
#Makefile.am:2:   while processing Libtool library 'libcompress.la'

AC_PROG_LIBTOOL

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([fcntl.h limits.h stdlib.h string.h unistd.h])

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_MMAP
AC_CHECK_FUNCS([munmap])


# 告诉 Autoconf 通过 Makefile.in 自动生成 Makefile 
AC_CONFIG_FILES([Makefile])

AC_OUTPUT
