.PHONY:clean all
CC=g++
CPPFLAGS=-Wall -g --save-temps
BIN= hide hide1 hide2 hide3
all:$(BIN)
%:%.c
	$(CC) $(CPPFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN) *.s *.ii

