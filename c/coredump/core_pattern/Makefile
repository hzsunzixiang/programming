.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=core_pattern_pipe_test
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

