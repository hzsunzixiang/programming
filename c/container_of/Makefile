.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=main test typeof
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
	$(CC) -S $(CFLAGS)  $< -o $@.s 

clean:
	rm -f *.o *.s $(BIN)

