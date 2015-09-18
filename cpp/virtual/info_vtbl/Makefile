.PHONY:clean all
CC=g++
CPPFLAGS=-Wall -g
BIN=virtual 
all:$(BIN)
%:%.c
	$(CC) $(CPPFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

