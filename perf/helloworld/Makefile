.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= long_test 
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
