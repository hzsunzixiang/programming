.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -lgmp
BIN= elgamal_encode elgamal_dsa
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
