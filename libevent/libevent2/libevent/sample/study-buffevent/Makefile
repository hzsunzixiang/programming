.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -static --save-temps
VPATH=../../include
INCLUDE = -I../../include 

LIB = -L../../.libs -levent


BIN=bufferevent_socket_new bufferevent_socket_connect_hostname hello-world bufferevent bufferevent-epollout
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  $(LIB)  $(INCLUDE) -o $@
clean:
	rm -f *.o $(BIN) *.s *.i

