#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([thread_app], [0.1], [haichengsun123@163.com])
AC_CONFIG_SRCDIR([src/main.c])
AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE([-Wall -Werror foreign])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.
have_pthreads=no
AC_SEARCH_LIBS([pthread_create], [pthread], [have_pthreads=yes])
# Checks for header files.
AC_CHECK_HEADERS([stdlib.h])
if test "x${have_pthreads}" = xyes; then
AC_CHECK_HEADERS([pthread.h], [], [have_pthreads=no])
fi
if test "x${have_pthreads}" = xno; then
AC_MSG_ERROR([
------------------------------------------
The pthread library and header files are
required to build jupiter. Stopping...
Check 'config.log' for more information.
------------------------------------------])
fi

#AC_MSG_WARN([
#------------------------------------------
#Unable to find pthreads on this system.
#Building a single-threaded version.
#------------------------------------------])
#fi



# Checks for header files.
AC_CHECK_HEADERS([stdlib.h pthread.h])

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([
 Makefile
 src/Makefile
])

AC_OUTPUT


#S["LIBS"]="-lpthread "
#hello$(EXEEXT): $(hello_OBJECTS) $(hello_DEPENDENCIES) $(EXTRA_hello_DEPENDENCIES)
#    @rm -f hello$(EXEEXT)
#    $(AM_V_CCLD)$(LINK) $(hello_OBJECTS) $(hello_LDADD) $(LIBS)

