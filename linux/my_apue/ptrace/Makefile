.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= ptrace_base ptrace_getregs ptrace_register ptrace_write_reverse ptrace_single_step dummy1 \
	 dummy2 ptrace_attach ptrace_breakpoints hello ptrace_inject_code
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
	gcc dummy1.s -o dummy1
clean:
	rm -f *.o $(BIN)
