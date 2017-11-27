.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps -fdump-class-hierarchy -fdump-tree-nrv -fno-elide-constructors
#CFLAGS=-Wall -g --save-temps -fdump-class-hierarchy -fdump-tree-nrv 
BIN=  trivial member_class base_class virtualFunction virtualBaseClass nrv
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -lm -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii *.class
