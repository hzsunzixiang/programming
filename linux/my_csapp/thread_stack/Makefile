.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=sharing
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ -lpthread
clean:
	rm -f *.o $(BIN)

