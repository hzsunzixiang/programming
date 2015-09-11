.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= setjmp 
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
