.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=writev writev1 readv
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

