.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=tcp_connect  tcp_listen udp_client udp_connect udp_server
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

