.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= jiemi_array jiemi_file check_code 
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
