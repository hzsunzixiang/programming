.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps -fdump-class-hierarchy
BIN=  main main1 temporary explicit
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -lm -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii *.class
