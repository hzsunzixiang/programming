.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=signal signal_bsd signal_sysv
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
