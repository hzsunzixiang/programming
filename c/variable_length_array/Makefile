.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -std=c99
BIN=main 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
	$(CC) -S $(CFLAGS)  $< -o $@.s 

clean:
	rm -f *.o *.s $(BIN)

