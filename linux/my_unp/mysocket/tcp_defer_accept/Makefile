.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
#BIN=echosrv echocli
BIN=tcp_defer_accept tcp_defer_accept_s
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

