.PHONY:clean all
CC=g++
#CFLAGS=-Wall -save-temps -O1
CFLAGS=-Wall -g -save-temps
BIN= traversal  traversal_1
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
