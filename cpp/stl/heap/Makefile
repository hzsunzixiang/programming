.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps
BIN= heap
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s *.ii
