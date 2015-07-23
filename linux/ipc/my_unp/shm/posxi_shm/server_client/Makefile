.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=  server1 client1
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS) -pthread -lrt $< -o $@
clean:
	rm -f *.o $(BIN)

