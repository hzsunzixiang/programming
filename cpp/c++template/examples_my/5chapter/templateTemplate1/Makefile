#
.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -ansi -W -Wall -pedantic
BIN= stack8test 
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
