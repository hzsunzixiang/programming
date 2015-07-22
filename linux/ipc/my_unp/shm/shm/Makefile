.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=  incr2 incr3 incr_map_anon incr_dev_zero
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS) -pthread $< -o $@
clean:
	rm -f *.o $(BIN)

