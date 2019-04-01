.PHONY:clean all
CC=g++
#CFLAGS=-Wall -save-temps -O1
CPPFLAGS=-Wall -g -save-temps
CFLAGS=-Wall -g -save-temps
BIN= main main_note
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
