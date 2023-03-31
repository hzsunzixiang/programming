# Copyright (C) 2006-2014 Free Software Foundation, Inc.
# This Makefile.am is free software; the Free Software Foundation
# gives unlimited permission to copy, distribute and modify it.

SUBDIRS = src
dist_doc_DATA = README

# — Variable: DEFS
# -D options to pass to the C compiler. If AC_CONFIG_HEADERS is called, configure replaces `@DEFS@' with -DHAVE_CONFIG_H instead
#DEFS = -DHAVE_CONFIG_H
#COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
#	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
# make[2]: Entering directory `/home/ericksun/programming/linux/automake/ac_search_libs/src'
# gcc -DHAVE_CONFIG_H -I. -I..     -g -O2 -MT main.o -MD -MP -MF .deps/main.Tpo -c -o main.o main.c
# mv -f .deps/main.Tpo .deps/main.Po
# gcc  -g -O2   -o hello main.o  -lpthread


DEFS = @DEFS@

TEST_SUBST=@PERCENT_SIGN@
TEST_SUBST_EX=@EXCLAMATION_SIGN@
