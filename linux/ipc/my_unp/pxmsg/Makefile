.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= mqcreate mqunlink mqgetattr mqcreate1
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  -lrt -o $@
clean:
	rm -f *.o $(BIN)

