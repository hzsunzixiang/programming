.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=main test
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 

clean:
	rm -f *.o $(BIN)

