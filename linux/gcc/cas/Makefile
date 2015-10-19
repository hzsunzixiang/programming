.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -lpthread
BIN= cas_pthread 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@
clean:
	rm -f *.o $(BIN)
