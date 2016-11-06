.PHONY:clean all
CC=gcc
#CFLAGS=-Wall -save-temps -O1
CFLAGS=-Wall -g -save-temps
BIN= traversal 
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
