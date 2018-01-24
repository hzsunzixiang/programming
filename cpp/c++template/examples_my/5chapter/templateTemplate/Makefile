#
.PHONY:clean all
CC=g++
#CFLAGS=-Wall -g -ansi -W -Wall -pedantic
CFLAGS=-Wall -g -std=c++11 -W -Wall -pedantic
BIN= stack7test 
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
