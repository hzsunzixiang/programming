.PHONY:clean all
CC=g++
CPPFLAGS=-Wall -g --save-temps -fdump-class-hierarchy
BIN=virtual virtual_offset
all:$(BIN)
%:%.c
	$(CC) $(CPPFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN) *.s *.ii *.class

