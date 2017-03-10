.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= predict1 predict2
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
