#
.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -std=c++11 -W -Wall -pedantic -Wno-enum-compare 
BIN= pow3 pow3b sqrt1 enum_warning sqrt2 condition sqrt3 sqrt4 loop1 loop2
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
