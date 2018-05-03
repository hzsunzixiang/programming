.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g  -lssl -lcrypto
BIN=ssl-server ssl-client
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
