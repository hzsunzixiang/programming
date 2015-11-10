.PHONY:clean all
CC=g++
CPPFLAGS=-Wall -g --save-temps
BIN=vtbl_value
all:$(BIN)
%:%.c
	$(CC) $(CPPFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN) *.s *.ii

