.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=tcp_connect  tcp_listen
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

