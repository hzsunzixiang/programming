.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN=epoll_echo_server_et epoll_echo_server_lt not_accept server client
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

