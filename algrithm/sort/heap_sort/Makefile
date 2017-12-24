.PHONY:clean all
CC=g++

CFLAGS=-Wall -g -save-temps -O1
CPPFLAGS=-Wall -g -save-temps -std=c++11
BIN= main1 heapify
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii






