.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=02fcntl 
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

