.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -lpthread
BIN= cas_pthread 
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
