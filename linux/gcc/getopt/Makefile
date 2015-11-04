.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -save-temps
BIN=getopt  getopt_long
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
