.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= test_rt_signal
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  -lrt -o $@
clean:
	rm -f *.o $(BIN)

