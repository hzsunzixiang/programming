.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=  shmcreate shmunlink shmwrite shmread test3
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS) -pthread -lrt $< -o $@
clean:
	rm -f *.o $(BIN)

