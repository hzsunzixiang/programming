.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= local1 local2 
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
