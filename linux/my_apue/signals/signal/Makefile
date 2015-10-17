.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -lpthread
BIN=signal signal_bsd signal_sysv signal_threadid
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
