.PHONY:clean all
CC=g++
CPPFLAGS=-Wall -g --save-temps
BIN=virtual virtual_non
all:$(BIN)
%:%.c
	$(CC) $(CPPFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN) *.s *.S *.ii

