.PHONY:clean all
CC=gcc
#CFLAGS=-Wall -save-temps -O1
CFLAGS=-Wall -g -save-temps
BIN= fib fib_recur fact_1  sum_1 sum_tail
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
