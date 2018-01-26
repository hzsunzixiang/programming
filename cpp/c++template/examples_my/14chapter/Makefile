#
.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -std=c++11 -W -Wall -pedantic -Wno-enum-compare 
#BIN=  dynapoly
BIN= printmax 
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
