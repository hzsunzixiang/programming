#
.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -ansi -W -Wall -pedantic
BIN= max5 max6 refnonref 
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
