.PHONY:clean all
CC=gcc
CFLAGS=-Wall   -g  -save-temps
#CFLAGS=-Wall -O1 -save-temps
BIN= main  
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS) -O0   $< -o $@_O0
	$(CC) $(CFLAGS) -O1   $< -o $@_O1
	
clean:
	rm -f *.o $(BIN) *.s *.i
