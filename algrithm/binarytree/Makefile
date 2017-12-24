.PHONY:clean all
CC=g++
#CFLAGS=-Wall -save-temps -O1
CPPFLAGS=-Wall -g -save-temps
CFLAGS=-Wall -g -save-temps
BIN= traversal  traversal_1 traversal_my
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
