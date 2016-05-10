.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -O1 -save-temps
#CFLAGS=-Wall -O1 -save-temps
BIN= main  
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
