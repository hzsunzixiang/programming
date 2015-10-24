.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= zero_length_array
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
