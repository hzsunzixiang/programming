.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= gnuc 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  assembly.s $< -o $@
	gcc -S assembly.s -o ass.s
clean:
	rm -f *.o $(BIN)
