.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= global_friend 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
