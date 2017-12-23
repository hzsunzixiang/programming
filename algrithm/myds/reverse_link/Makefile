.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= reverse  reverse1
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
