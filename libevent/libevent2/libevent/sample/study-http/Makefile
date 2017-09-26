.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -static
VPATH=../../include
INCLUDE = -I../../include  -I..

LIB = -L../../.libs -levent -lrt

VPATH=../
BIN=http-server myserver evhttp_new http-connect myconnect https-client
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  $(LIB)  $(INCLUDE) -o $@
clean:
	rm -f *.o $(BIN)

