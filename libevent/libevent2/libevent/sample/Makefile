.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
VPATH=../include
INCLUDE = -I../include 

LIB = -L../.libs -levent


BIN=hello-world dns-example  event-read-fifo  hello-world http-connect  signal-test time-test hello
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< $(LIB) $(INCLUDE) -o $@
clean:
	rm -f *.o $(BIN)

