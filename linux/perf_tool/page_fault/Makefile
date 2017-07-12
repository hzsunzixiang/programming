.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps
BIN=pagefault
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
