.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=server_prefork server_prefork_meter server_prefork_select
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

