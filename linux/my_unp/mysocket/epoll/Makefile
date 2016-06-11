.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=epoll_create epoll_ctl epoll_wait epoll_ctl_socket epoll_wait_socket epoll_wait_socket_levle epoll_wait_socket_ptr\
	epoll_oneshot epoll_errno epoll_wait_epollout
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

