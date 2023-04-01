#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([ac_define], [1.0], [bug-automake@gnu.org])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])

AC_PROG_CC
AC_CONFIG_HEADERS([config.h])


## 如果出错，就用方括号
AC_DEFINE(HELLO,[], [test hello])
AC_DEFINE(MY_VERSION, ["5.6.7.8.9"], [test the varable])



AC_DEFINE(VERSION, "5.6.7.8.9")

myvar="foo"
othervar="bar"
AC_DEFINE_UNQUOTED(PACKAGE_URL, "${myvar}${othervar}")

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

#/* Name of package */
##define PACKAGE "ac_define"
#
#/* Define to the address where bug reports for this package should be sent. */
##define PACKAGE_BUGREPORT "bug-automake@gnu.org"
#
#/* Define to the full name of this package. */
##define PACKAGE_NAME "ac_define"
#
#/* Define to the full name and version of this package. */
##define PACKAGE_STRING "ac_define 1.0"
#
#/* Define to the one symbol short name of this package. */
##define PACKAGE_TARNAME "ac_define"
#
#/* Define to the home page for this package. */
##define PACKAGE_URL "foobar"
#
#/* Define to the version of this package. */
##define PACKAGE_VERSION "1.0"
#
#/* Version number of package */
##define VERSION "5.6.7.8.9"
