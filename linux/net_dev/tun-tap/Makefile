.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= tun  tap
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

