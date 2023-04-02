#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([Jupiter], [1.0], [jupiter-bugs@example.org])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
LT_PREREQ([2.4.2])
AC_CONFIG_SRCDIR([src/main.c])
AC_CONFIG_HEADERS([config.h])

AC_CONFIG_MACRO_DIR([m4])

AC_CONFIG_TESTDIR([tests])

# Checks for programs.
AC_PROG_CC
AM_PROG_AR
AC_PROG_INSTALL

AM_PROG_CC_C_O
#src/Makefile.am:2: warning: compiling 'main.c' with per-target flags requires 'AM_PROG_CC_C_O' in 'configure.ac'



LT_INIT([dlopen])

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h])

# Checks for command-line options
AC_ARG_ENABLE([async-exec],
    [AS_HELP_STRING([--disable-async-exec],
        [disable asynchronous execution @<:@default: no@:>@])],
    [async_exec=${enableval}], [async_exec=yes])

if test "x${async_exec}" = xyes; then
    have_pthreads=no
    AC_SEARCH_LIBS([pthread_create], [pthread], [have_pthreads=yes])

    if test "x${have_pthreads}" = xyes; then
        AC_CHECK_HEADERS([pthread.h], [], [have_pthreads=no])
    fi

    if test "x${have_pthreads}" = xno; then
        AC_MSG_WARN([
  ------------------------------------------
  Unable to find pthreads on this system.
  Building a single-threaded version.
  ------------------------------------------])
        async_exec=no
    fi
fi

AC_SUBST([async_exec])
if test "x${async_exec}" = xyes; then
    AC_DEFINE([ASYNC_EXEC], [1], [async execution enabled])
fi

# Checks for libraries.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile
                 common/Makefile
                 include/Makefile
                 libjup/Makefile
                 src/Makefile ])
AC_OUTPUT

cat << EOF
-------------------------------------------------

${PACKAGE_NAME} Version ${PACKAGE_VERSION}

Prefix: '${prefix}'.
Compiler: '${CC} ${CFLAGS} ${CPPFLAGS}'
Libraries: '${LIBS}'

Package features:
  Async Execution: ${async_exec}

  Now type 'make @<:@<target>@:>@'
    where the optional <target> is:
      all                - build all binaries
      install            - install everything

--------------------------------------------------
EOF




#autoreconf: running: libtoolize --copy
#libtoolize: putting auxiliary files in `.'.
#libtoolize: copying file `./ltmain.sh'
#libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac and
#libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
#libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
#libtoolize: `AC_PROG_RANLIB' is rendered obsolete by `LT_INIT'
#configure.ac:16: warning: LT_INIT was called before AM_PROG_AR
#/usr/share/aclocal-1.13/ar-lib.m4:13: AM_PROG_AR is expanded from...
#configure.ac:16: the top level
#autoreconf: running: /usr/bin/autoconf
#configure.ac:16: warning: LT_INIT was called before AM_PROG_AR
#aclocal.m4:8661: AM_PROG_AR is expanded from...
#configure.ac:16: the top level
#autoreconf: running: /usr/bin/autoheader
#configure.ac:16: warning: LT_INIT was called before AM_PROG_AR
#aclocal.m4:8661: AM_PROG_AR is expanded from...
#configure.ac:16: the top level
#autoreconf: running: automake --add-missing --copy --no-force
#configure.ac:16: warning: LT_INIT was called before AM_PROG_AR
#aclocal.m4:8661: AM_PROG_AR is expanded from...

