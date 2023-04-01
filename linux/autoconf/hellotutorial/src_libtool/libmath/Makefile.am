noinst_LTLIBRARIES = libhwmath.la

# .am:2: error: 'bindir' is not a legitimate directory for 'LTLIBRARIES'
# automake: warnings are treated as errors
# libmath/Makefile.am:4: warning: variable 'libhwmath_la_SOURCES' is defined but no program or
# libmath/Makefile.am:4: library has 'libhwmath_la' as canonical name (possible typo)
# libmath/Makefile.am:6: warning: variable 'libhwmath_la_LIBADD' is defined but no program or
# libmath/Makefile.am:6: library has 'libhwmath_la' as canonical name (possible typo)
# autoreconf: automake failed with exit status: 1

# 用这个报上名的错误
#bin_LTLIBRARIES = libhwmath.la

libhwmath_la_SOURCES = hwmath.c

libhwmath_la_LIBADD = 

# In case we need to define include files, or other flags for the
# C preprocessor, we can add them to the following variable
# libhwmath_la_CPPFLAGS = 

# Headers file that are going to be installed in <prefix>/include
# include_HEADERS = 

