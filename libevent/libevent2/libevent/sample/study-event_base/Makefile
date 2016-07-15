.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -static --save-temps
VPATH=../../include
INCLUDE = -I../../include 

LIB = -L../../.libs -levent


BIN=event_config_new
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  $(LIB)  $(INCLUDE) -o $@
clean:
	rm -f *.o $(BIN) *.s *.i

