.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=signalfd_fd signalfd_main
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
