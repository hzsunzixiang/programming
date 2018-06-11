.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN=sha2 
all:$(BIN)
%:%.c sha2prog.c 
	$(CC) $(CFLAGS) sha2prog.c  $< -o $@
	$(CC) -S $< -o $@.s
#cc -O2 -DSHA2_UNROLL_TRANSFORM -Wall -o sha2 sha2prog.c sha2.c
	
clean:
	rm -f *.o $(BIN) *.s
