.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=sockaddr_in.c
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

