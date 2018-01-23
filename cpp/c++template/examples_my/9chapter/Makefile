#
.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -ansi -W -Wall -pedantic
BIN= syntax syntax1 typename template template1 typename1
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
