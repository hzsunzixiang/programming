.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
IN= stack3test
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
