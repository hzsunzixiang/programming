.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -lgmp
BIN=dsa_alg 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
