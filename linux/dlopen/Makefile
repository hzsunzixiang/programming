.PHONY:clean all
CC=gcc
#gcc -rdynamic -o main main.c -ldl

CFLAGS=-Wall -rdynamic -ldl -g --save-temps
BIN= main 
all:$(BIN)
%:%.c 
	gcc $(CFLAGS) -o main main.c 
	
clean:
	rm -f *.o $(BIN) *.s
