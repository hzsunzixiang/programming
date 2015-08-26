.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= sigaltstack sigaltstack_raise sigaltstack_static
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
