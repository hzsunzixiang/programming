.PHONY:clean all
CC=g++
CFLAGS=-Wall -g  
BIN= simple
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS) $< -o $@
	  #$(CC) $(CFLAGS) -D USE_INLINE $< -o  $@
	  #$(CC) $(CFLAGS) -finline-functions $< -o $@_non 
	  #$(CC) -S  -D USE_INLINE $< -o  $@.s
	  #$(CC) -S  -finline-functions $< -o  $@_non.s
clean:
	rm -f *.o $(BIN) *.s
