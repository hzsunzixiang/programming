.PHONY:clean all
CC=gcc
#gcc -rdynamic -o main main.c -ldl

CFLAGS=-Wall -rdynamic -ldl -g --save-temps
BIN= main  main1
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
