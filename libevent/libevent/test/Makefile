# Generated automatically from Makefile.in by configure.
#
# Makefile for libevent
#
# Dug Song <dugsong@monkey.org>
#
# $Id: Makefile.in,v 1.1.1.1 2002/04/09 15:14:08 nprovos Exp $

srcdir          = .

install_prefix  =
prefix          = /usr/local
exec_prefix	= ${prefix}
libdir		= ${exec_prefix}/lib
mandir		= ${prefix}/man
includedir	= ${prefix}/include

CC	= gcc
RANLIB	= ranlib
DEFS	= -DHAVE_CONFIG_H
CFLAGS	= -g -O2 $(DEFS) -Wall -I/usr/include -I$(srcdir) -I$(srcdir)/..
LDFLAGS	=  -L.. -levent

INSTALL	= /usr/bin/install -c
INSTALL_DATA	= ${INSTALL} -m 644
LN_S = ln -s

TARGET	= test-eof test-weof
.c.o:
	$(CC) $(CFLAGS) -c $(srcdir)/$*.c

test: $(TARGET)
	@echo "Running tests:"
	@echo -n " test-eof: "
	@if ./test-eof >/dev/null ; \
	then \
		echo OKAY ; \
	else \
		echo FAILED ; \
	fi
	@echo -n " test-weof: "
	@if ./test-weof >/dev/null ; \
	then \
		echo OKAY ; \
	else \
		echo FAILED ; \
	fi

test-eof: test-eof.o
	$(CC) $(CFLAGS)	$(INCS) -o $@ test-eof.o $(LDFLAGS)

test-weof: test-weof.o
	$(CC) $(CFLAGS)	$(INCS) -o $@ test-weof.o $(LDFLAGS)

install:

clean:
	rm -f *.o *~ $(TARGET)

distclean: clean
	rm -f Makefile

# EOF
