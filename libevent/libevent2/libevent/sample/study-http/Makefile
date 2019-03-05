.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g 
#VPATH=../../include
#INCLUDE = -I../../include  -I..
INCLUDE = -I/usr/local/include/event2

LIB =  
#LIB = -L../../.libs -lrt ../../.libs/libevent.a 
#LIB = -L../../.libs -lrt ../../.libs/libevent.a 
#LIBHTTPS = -L../../.libs ../../.libs/libevent.a ../../.libs/libevent_openssl.a -lssl -lcrypto  ../libcurl.a 

LIB =-L/usr/local/lib -lrt -levent 
LIBHTTPS = -levent -levent_openssl -lssl -lcrypto  -lcurl 

BIN=http-server myserver evhttp_new myconnect  http-client http-client-s

#BINHTTPS=https-client 

all:$(BIN) #$(BINHTTPS)

$(BIN):%:%.c 
	$(CC) $(CFLAGS)  $^ $(LIB) $(INCLUDE) -o $@

#$(BINHTTPS):%:%.c ../openssl_hostname_validation.c
#	$(CC) $(CFLAGS)  $^ $(LIBHTTPS) $(INCLUDE) -o $@

clean:
	rm -f *.o $(BIN) $(BINHTTPS)

