.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= ptrace_base ptrace_getregs ptrace_register ptrace_write_reverse ptrace_single_step dummy1
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
	gcc dummy1.s -o dummy1
clean:
	rm -f *.o $(BIN)
