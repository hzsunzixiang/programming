.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN=  main main_note
all:$(BIN) 
%:%.cpp  
	$(CC) $(CFLAGS) $< -o $@
	$(CC) -S $(CFLAGS) $< -o $@.s


clean:
	rm -f *.o $(BIN) *.s
