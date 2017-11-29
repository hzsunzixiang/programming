.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN=  main
all:$(BIN) 
%:%.cpp  
	$(CC) $(CFLAGS) z_memcheck.cpp  $< -o $@

clean:
	rm -f *.o $(BIN) *.s
