.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN=  main
all:$(BIN) 
%:%.cpp  
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f *.o $(BIN) *.s
