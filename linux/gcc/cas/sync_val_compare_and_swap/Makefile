.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -lpthread
BIN= sync_bool_compare_and_swap sync_val_compare_and_swap 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) $(CFLAGS) -S  $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
