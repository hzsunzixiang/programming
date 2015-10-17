.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= test_class test_class_non
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
