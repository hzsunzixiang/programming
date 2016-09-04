.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -static
VPATH=../../include
INCLUDE = -I../../include 

LIB = -L../../.libs -levent


BIN=time-test time-test1
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  $(LIB)  $(INCLUDE) -o $@
clean:
	rm -f *.o $(BIN)

