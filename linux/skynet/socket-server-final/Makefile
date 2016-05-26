.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN=socket-server echoserv  echocli
all:$(BIN)
socket-server:socket_server.c test.c
	gcc -g -Wall -o $@ $^ -lpthread

echoserv: socket_server.c echoserv.c
	gcc -g -Wall -o $@ $^ -lpthread
echocli: socket_server.c echocli.c
	gcc -g -Wall -o $@ $^ -lpthread
clean:
	rm $(BIN)  -rf

