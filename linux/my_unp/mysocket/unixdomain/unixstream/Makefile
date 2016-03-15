.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=unixstrserv01 unixstrcli01
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

