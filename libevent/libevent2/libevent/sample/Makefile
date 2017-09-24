.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
VPATH=../include
INCLUDE = -I../include  -I../include/event2/

LIB = -L../.libs ../.libs/libevent.a 
LIBHTTPS = -L../.libs ../.libs/libevent.a ../.libs/libevent_openssl.a -lssl -lcrypto  ./libcurl.a


#sudo aptitude search libssl-dev

BIN=hello-world dns-example  event-read-fifo  http-connect  signal-test time-test 
BINHTTPS=https-client http-client

all:$(BIN) $(BINHTTPS)

$(BIN):%:%.c 
	$(CC) $(CFLAGS)  $^ $(LIB) $(INCLUDE) -o $@

$(BINHTTPS):%:%.c ./openssl_hostname_validation.c
	$(CC) $(CFLAGS)  $^ $(LIBHTTPS) $(INCLUDE) -o $@
clean:
	rm -f *.o $(BIN) $(BINHTTPS)

