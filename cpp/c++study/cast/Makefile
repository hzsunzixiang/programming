.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps -std=c++11
#CFLAGS=-Wall -g --save-temps 
BIN= reinterpret_cast reinterpret_cast_asm static_cast static_cast_asm typeid dynamic_cast dynamic_cast1 const_cast
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
