.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= memcpy  memcpy_htons memcpyStr test_core
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
