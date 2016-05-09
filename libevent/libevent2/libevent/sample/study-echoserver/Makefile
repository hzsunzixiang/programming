.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -static --save-temps
VPATH=../../include
INCLUDE = -I../../include 

LIB = -L../../.libs -levent  -lrt


BIN=echoserver
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  $(LIB)  $(INCLUDE) -o $@
clean:
	rm -f *.o $(BIN) *.s *.i

