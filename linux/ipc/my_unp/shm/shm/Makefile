.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=  incr2
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS) -pthread $< -o $@
clean:
	rm -f *.o $(BIN)

