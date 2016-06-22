.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -I/usr/include/lua5.1 -llua5.1

BIN= callfunc
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
