.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= helloworld  query_string query_post view_post
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
