.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= singleton_main static_data_member static_fun_member
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	$(CC) -S $< -o $@.s
	
clean:
	rm -f *.o $(BIN) *.s
