.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=inet_aton inet_addr inet_ntoa
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

