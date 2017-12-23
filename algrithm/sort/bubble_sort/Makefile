.PHONY:clean all
CC=g++

#CFLAGS=-Wall -save-temps -O1
CFLAGS=-Wall -g -save-temps -std=c++11
BIN= main  main_opt main_cpp
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii






