.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= main 
all:$(BIN)
%:%.c stack.c 
	$(CC) $(CFLAGS)   $< stack.c -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
