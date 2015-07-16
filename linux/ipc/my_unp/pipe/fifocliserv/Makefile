.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= server_main client_main
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

