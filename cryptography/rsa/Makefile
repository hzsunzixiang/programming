.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -lgmp
BIN= mod_multi_inverse  rsa_experiment invert_gmp rsa_gmp rsa_gmp_en pohlig_hellman
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
