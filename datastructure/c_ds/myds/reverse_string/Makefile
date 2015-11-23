.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=reverse
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf $(BIN) *.o


