.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=epoll_create epoll_ctl epoll_wait
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

