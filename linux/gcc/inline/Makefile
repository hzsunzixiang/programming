.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g  
BIN= inline  inline_non inline_loop inline_loop_non
all:$(BIN)
%:%.c
#$(CC) $(CFLAGS) -std=c99  $< -o $@
	$(CC) $(CFLAGS) -D USE_INLINE $< -o  $@
	$(CC) $(CFLAGS) -finline-functions $< -o $@_non 
	$(CC) -S  -D USE_INLINE $< -o  $@.s
	$(CC) -S  -finline-functions $< -o  $@_non.s
clean:
	rm -f *.o $(BIN) *.s
