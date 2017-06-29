.PHONY:clean all
CC=g++
CFLAGS=-Wall -gdwarf-2 -g3 --save-temps
#CFLAGS=-Wall -g3 --save-temps
#$CFLAGS=-Wall -g --save-temps
BIN= main  
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii *.i
