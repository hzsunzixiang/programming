.PHONY:clean all
CC=g++
CFLAGS=-Wall -g  
BIN= badleak 
$(BIN):badleak.cpp tree.cpp
	$(CC) $(CFLAGS) $< tree.cpp -o $@

clean:
	rm -f *.o $(BIN) *.s
