.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps
BIN= const_member matrix
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
