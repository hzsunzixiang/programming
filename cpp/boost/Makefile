.PHONY:clean all
CC=g++
CPPFLAGS=-Wall -g  -lboost_thread-mt  
BIN=asio_thread format
all:$(BIN)
%:%.c
	$(CC) $(CPPFLAGS)  $< -o $@ 
clean:
	rm -f *.o $(BIN)

