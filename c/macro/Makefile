.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g --save-temps -std=c99
BIN= main #double int
all:$(BIN) 
%:%.c 
	$(CC) $(CFLAGS)  lib/print_fun.c  $< -o $@ -lm
	
clean:
	rm -f *.o $(BIN) *.s *.i
