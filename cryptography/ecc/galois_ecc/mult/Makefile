.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= main 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
