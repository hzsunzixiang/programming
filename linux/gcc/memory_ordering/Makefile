.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= test1  test_barriers
all:$(BIN)
%:%.c 
	$(CC) -S -O0  $< -o $@O0.s
	$(CC) -S -O2  $< -o $@O2.s
	
clean:
	rm -f *.o $(BIN) *.s
