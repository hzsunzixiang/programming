.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= data_location1 data_location2 
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
