.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
#BIN=echosrv echocli
BIN=so_acceptconn so_type so_protocol
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

