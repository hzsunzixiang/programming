.PHONY:clean all
CC=g++
#CFLAGS=-Wall -save-temps -O1
#CFLAGS=-Wall -g -save-temps -std=c99
CFLAGS=-Wall -g -save-temps 
BIN= main   main1 main2 main3
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
