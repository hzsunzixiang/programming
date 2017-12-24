.PHONY:clean all
CC=g++
CFLAGS=-Wall -g  -std=c++11
BIN= main 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
