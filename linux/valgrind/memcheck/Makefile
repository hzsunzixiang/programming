.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g  -std=c99
BIN= simple badloop badacc badlap
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS) $< -o $@
	  #$(CC) $(CFLAGS) -D USE_INLINE $< -o  $@
	  #$(CC) $(CFLAGS) -finline-functions $< -o $@_non 
	  #$(CC) -S  -D USE_INLINE $< -o  $@.s
	  #$(CC) -S  -finline-functions $< -o  $@_non.s
clean:
	rm -f *.o $(BIN) *.s
