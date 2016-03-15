.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=mycat openfile
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

