.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= alignment  csapp_align csapp_align2
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
