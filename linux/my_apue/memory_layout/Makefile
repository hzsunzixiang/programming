.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= memory_layout memory_segment_fault 
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

