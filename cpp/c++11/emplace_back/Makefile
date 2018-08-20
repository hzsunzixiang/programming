.PHONY:clean all
CC=g++ 

CFLAGS = -std=c++11 -g --save-temps
BIN= emplace_back 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
