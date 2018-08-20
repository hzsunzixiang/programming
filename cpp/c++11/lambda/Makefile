.PHONY:clean all
CC=g++ 

CFLAGS = -std=c++14 -g --save-temps
BIN= lambda1 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
