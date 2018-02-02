.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -lgmp
BIN= mpz_pow_ui 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
