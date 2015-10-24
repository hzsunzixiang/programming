.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -lpthread
BIN= main32  main_non32 main64 main_non64
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) $(CFLAGS) -S  $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
