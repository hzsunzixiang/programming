.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= loop1 loop2 
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
