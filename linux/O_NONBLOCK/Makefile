.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=locked_files pseudo-files
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

