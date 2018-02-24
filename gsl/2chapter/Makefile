.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -lgsl -lgslcblas
BIN=  example
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
