.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= makecontext infinite_loop iterator swapcontext
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

