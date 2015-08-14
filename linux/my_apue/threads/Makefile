.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=pthread_create_man
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ -lpthread
clean:
	rm -f *.o $(BIN)

