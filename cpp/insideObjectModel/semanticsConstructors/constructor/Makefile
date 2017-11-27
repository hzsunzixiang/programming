.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps -fdump-class-hierarchy
BIN=  trivial member_class base_class virtualFunction virtualBaseClass
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -lm -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii *.class
