.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=socket bind listen accept bind_multi connect
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

