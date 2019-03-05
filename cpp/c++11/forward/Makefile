.PHONY:clean all
CC=g++ 

CFLAGS = -std=c++11 -g --save-temps
BIN=  forward1 forward2 forward3 forward4 forward5 remove_reference forward6 forward7
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
