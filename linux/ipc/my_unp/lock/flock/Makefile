.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= locknone  lockfcntl
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  -lrt -o $@
clean:
	rm -f *.o $(BIN)

