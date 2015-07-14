.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= pipe_man  pipe_error pipe_sigpipe mainpipe
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

