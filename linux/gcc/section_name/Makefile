.PHONY:clean all
CC=gcc
CPP=g++
CFLAGS=-Wall -g -save-temps
BIN=section_name
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
%:%.cpp 
	$(CPP) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
