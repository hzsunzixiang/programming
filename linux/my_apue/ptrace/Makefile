.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= ptrace_base ptrace_getregs ptrace_register
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
