#
.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -ansi -W -Wall -pedantic
BIN=  thisPointer
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
