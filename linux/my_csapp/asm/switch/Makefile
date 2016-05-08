.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= switch switch_label
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)   $< -o $@
	gcc -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
