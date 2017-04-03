.PHONY:clean all
CC=gcc
#CFLAGS=-Wall -save-temps -O1
#CFLAGS=-Wall -g -save-temps
CFLAGS=-Wall -g 
BIN= lcg lcg_helloworld lcg_para lcg_test
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i
