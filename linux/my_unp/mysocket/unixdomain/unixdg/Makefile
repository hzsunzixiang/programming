.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=unixdgserv01 unixdgcli01
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

