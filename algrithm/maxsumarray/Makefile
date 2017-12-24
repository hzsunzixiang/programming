.PHONY:clean all
CC=g++
#CFLAGS=-Wall -save-temps -O1
#CFLAGS=-Wall -g -save-temps
CFLAGS=-Wall -g  -std=c++11
CPPFLAGS=-Wall -g  -std=c++11 
BIN= maxSubArray maxSubArray1
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
