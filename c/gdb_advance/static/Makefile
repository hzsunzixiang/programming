.PHONY:clean all
CC=gcc
CFLAGS=-Wall -gdwarf-2 -g -static --save-temps
#CFLAGS=-Wall -g3 --save-temps
#$CFLAGS=-Wall -g --save-temps
BIN= main 
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
