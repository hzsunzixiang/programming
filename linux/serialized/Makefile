.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
BIN= main_men main_net  uint64_t
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
