.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps
BIN= Point3d
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -lm -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
