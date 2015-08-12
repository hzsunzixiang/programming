.PHONY:clean all
CC=gcc
#CFLAGS=-Wall -g
CFLAGS= -g
BIN=size_of_use mallopt  memory_layout memory_segment_fault  tshm stackoverflow
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

