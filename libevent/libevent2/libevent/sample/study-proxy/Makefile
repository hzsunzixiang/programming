.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -static
VPATH=../../include
INCLUDE = -I../../include 

LIB = -L../../.libs -levent -lrt


BIN=proxy
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  $(LIB)  $(INCLUDE) -o $@
clean:
	rm -f *.o $(BIN)

