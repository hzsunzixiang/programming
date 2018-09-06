.PHONY:clean all
CC=g++ 

CFLAGS = -std=c++11 -g --save-temps
BIN= variant  get out_stream apply_visitor apply_visitor1 object_varaint
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
