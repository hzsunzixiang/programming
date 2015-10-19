.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -lpthread
BIN= sync_fetch_and_add 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) $(CFLAGS) -S  $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
