.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -lpthread
BIN= asm_volatile sync_synchronize sync_lock_release
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) $(CFLAGS) -S  $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
