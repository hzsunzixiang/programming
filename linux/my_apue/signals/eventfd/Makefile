.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=eventfd_fd eventfd_main
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
