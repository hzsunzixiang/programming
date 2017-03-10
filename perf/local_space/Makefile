.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= local_space predict predict1
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
