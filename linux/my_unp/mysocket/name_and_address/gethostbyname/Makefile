.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= main1 main2 hostent hostent2 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

