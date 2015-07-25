.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= effect_of_mmap mmapcopy mmap_read 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS) -pthread -lrt $< -o $@
clean:
	rm -f *.o $(BIN)

