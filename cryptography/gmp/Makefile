.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -lgmp
BIN= mpz_pow_ui parameter_3_5  init_5_1 assignment_5_2 conversion_5_4 division_5_6 exp_5_7 number_theoretic_5_9
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
