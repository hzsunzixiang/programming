.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=inet_aton inet_addr
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

