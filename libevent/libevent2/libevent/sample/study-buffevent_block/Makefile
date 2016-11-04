.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -static 
VPATH=../../include
INCLUDE = -I../../include 

LIB = -L../../.libs -levent  -lrt 


BIN=echoserver echoserver_block#bufferevent_socket_new #bufferevent_socket_connect_hostname hello-world bufferevent bufferevent-epollout
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  $(LIB)  $(INCLUDE) -o $@
clean:
	rm -f *.o $(BIN) *.s *.i

