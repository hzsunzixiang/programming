.PHONY:clean all
CC=g++
CFLAGS=-Wall -std=c++11 -g --save-temps
BIN= XXX 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
