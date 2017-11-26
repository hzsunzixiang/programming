.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g  
BIN = volatile
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS) $< -o $@
	$(CC) -S  $< -o  $@.s
clean:
	rm -f *.o $(BIN) *.s
