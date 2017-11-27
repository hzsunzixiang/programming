.PHONY:clean all
CC=g++
CPPFLAGS=-Wall -g --save-temps
BIN=vtbl vtbl_no_inheritance vtbl_inheritance vtbl_inheritance_override vtbl_mulit_inhrit vtbl_mulit_inhrit_override\
	vtbl_duplicate_inherit vtbl_address
all:$(BIN)
%:%.c
	$(CC) $(CPPFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN) *.s *.ii

