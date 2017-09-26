.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g 
VPATH=../../include
INCLUDE = -I../../include  -I..

LIB = -L../../.libs -levent -lrt
LIBHTTPS = -L../../.libs ../../.libs/libevent.a ../../.libs/libevent_openssl.a -lssl -lcrypto  ../libcurl.a 

BIN=http-server myserver evhttp_new http-connect myconnect 

BINHTTPS=https-client

all:$(BIN) $(BINHTTPS)

$(BIN):%:%.c 
	$(CC) $(CFLAGS)  $^ $(LIB) $(INCLUDE) -o $@

$(BINHTTPS):%:%.c ../openssl_hostname_validation.c
	$(CC) $(CFLAGS)  $^ $(LIBHTTPS) $(INCLUDE) -o $@

clean:
	rm -f *.o $(BIN) $(BINHTTPS)

