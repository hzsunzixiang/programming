.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=  incr2 incr3 incr_map_anon incr_dev_zero test1
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS) -pthread -lm $< -o $@
clean:
	rm -f *.o $(BIN)

