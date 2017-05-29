.PHONY:clean all
CC=g++
CFLAGS=-Wall -g  
BIN= double_delete  badmac
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f *.o $(BIN) *.s
