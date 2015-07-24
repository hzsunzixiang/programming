.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=  shmget shmrmid shmwrite shmread 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS) -pthread -lrt $< -o $@
clean:
	rm -f *.o $(BIN)

