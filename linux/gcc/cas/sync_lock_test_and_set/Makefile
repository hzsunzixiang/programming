.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -lpthread
BIN= sync_lock_test_and_set

all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) $(CFLAGS) -S  $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
