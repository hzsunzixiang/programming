.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= friend_function 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
