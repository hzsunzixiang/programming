.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps
BIN= hide  hide1_virtual hide_1 override overload override1
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
