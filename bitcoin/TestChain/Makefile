.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -std=c++11 -lstdc++ -x c++ 
BIN= main 
all:$(BIN)
#gcc -lstdc++ -o TestChain main.cpp 
%:%.cpp 
	$(CC) $(CFLAGS)  Block.cpp Blockchain.cpp sha256.cpp  $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s

