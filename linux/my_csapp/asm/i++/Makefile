.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -save-temps
BIN= main  main1
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
