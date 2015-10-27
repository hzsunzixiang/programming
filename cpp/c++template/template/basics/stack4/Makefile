.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= stack4test stack4test1
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
