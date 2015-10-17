.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= helloworld  add copy_and_add
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)   $< -o $@
	gcc -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
