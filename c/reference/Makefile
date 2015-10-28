.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= main pointer_fun pointer_var reference_fun reference_var
all:$(BIN)
%:%.cpp 
	$(CC) -S $< -o $@.s
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
