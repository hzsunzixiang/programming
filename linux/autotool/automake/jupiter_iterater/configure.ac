#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([Jupiter], [1.0], [jupiter-bugs@example.org])
#AM_INIT_AUTOMAKE([-Wall -Werror foreign dist-bzip2 subdir-objects])
AM_INIT_AUTOMAKE([-Wall -Werror foreign dist-bzip2])
#subdir-objects
#The subdir-objects option is required when you intend to reference
#sources from directories other than the current directory. Using this
#option causes Automake to generate make commands that cause object
#and intermediate files to be generated into the same directory as the
#source file. For more information on this option, see “Nonrecursive
#Automake” on page 175.
AC_CONFIG_SRCDIR([src/main.c])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CC
AM_PROG_AR
AC_PROG_INSTALL
AC_PROG_RANLIB
#common/Makefile.am:2: error: library used but 'RANLIB' is undefined
#common/Makefile.am:2:   The usual way to define 'RANLIB' is to add 'AC_PROG_RANLIB'

AM_PROG_CC_C_O
#src/Makefile.am:2: warning: compiling 'main.c' with per-target flags requires 'AM_PROG_CC_C_O' in 'configure.ac'



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

AC_CONFIG_FILES([Makefile])
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
