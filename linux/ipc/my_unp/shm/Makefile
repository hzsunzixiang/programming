.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=  mmap_read mmapcopy effect_of_mmap
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

