.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
#BIN= unixbind unixstrcli01 unixstrserv01
BIN= unixbind
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

