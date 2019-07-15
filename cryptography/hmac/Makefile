.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -lcrypto
BIN= hmac256 hmac2561
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
