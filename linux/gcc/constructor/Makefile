.PHONY:clean all
CC=gcc
CPP=g++
CFLAGS=-Wall -g -save-temps
BIN= constructor  test1 test2 init_array constructor_vs_static_class constructor_priority
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
%:%.cpp 
	$(CPP) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
