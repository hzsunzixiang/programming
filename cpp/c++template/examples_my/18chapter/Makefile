#
.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -std=c++11 -W -Wall -pedantic -Wno-enum-compare 
#BIN=  dynapoly
BIN= sarray1  sarray2 exprmain
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
