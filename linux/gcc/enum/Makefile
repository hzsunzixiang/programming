.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= enum_int enum_long define_int const_int
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
