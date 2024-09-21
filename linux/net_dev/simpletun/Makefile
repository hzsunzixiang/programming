.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= simpletun
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

