.PHONY:clean all
CC=g++
CFLAGS=-Wall -g  -std=c++11
BIN= const_main const_main_local const_main_fun static_const static_const_to_change class_const
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
