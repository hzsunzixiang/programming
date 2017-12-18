.PHONY:clean all
CC=gcc
#CFLAGS=-Wall -save-temps -O1
CFLAGS=-Wall -g -save-temps -std=c99
BIN= main  main1 mymemcpy mymemmove main_memmove
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
