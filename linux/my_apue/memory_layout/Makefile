.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= addr2line elf_of_use size_of_use mallopt  memory_layout memory_segment_fault  tshm stackoverflow
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

