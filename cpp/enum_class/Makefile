.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps -std=c++11
BIN= enum_class 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
