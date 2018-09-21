.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= main main1 
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
