.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= refrence 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
