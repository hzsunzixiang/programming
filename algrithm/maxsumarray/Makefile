.PHONY:clean all
CC=gcc
#CFLAGS=-Wall -save-temps -O1
#CFLAGS=-Wall -g -save-temps
CFLAGS=-Wall -g 
BIN= maxSubArray
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
