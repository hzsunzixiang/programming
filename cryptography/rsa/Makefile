.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -lm
BIN= mod_multi_inverse  rsa_experiment
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
