.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=psignal  sys_siglist
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
