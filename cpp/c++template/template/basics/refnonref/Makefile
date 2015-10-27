.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= refnonref main_typeid
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
