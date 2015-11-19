.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g --save-temps
BIN=test 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
