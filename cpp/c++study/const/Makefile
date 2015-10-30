.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= const_main const_main_local const_main_fun
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
