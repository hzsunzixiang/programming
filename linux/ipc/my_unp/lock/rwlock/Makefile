.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= rwlock 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  -lpthread -o $@
clean:
	rm -f *.o $(BIN)

