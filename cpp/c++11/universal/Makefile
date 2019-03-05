.PHONY:clean all
CC=g++ 

CFLAGS = -std=c++11 -g --save-temps
BIN= universal  item25
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
