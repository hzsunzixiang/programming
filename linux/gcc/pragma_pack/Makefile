.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= attribute_pack  attribute_aligned
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
