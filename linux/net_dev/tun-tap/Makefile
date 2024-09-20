.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= tun  tap tap_name  tun_name tap_persistent
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

