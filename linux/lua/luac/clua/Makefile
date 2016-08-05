.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -I/usr/include/lua5.1 -llua5.1

BIN= hello  callfunc callfunc_arg callfunc_table callfunc_1 callfunc_arg_1 callfunc_table_1
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
