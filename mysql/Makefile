.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g -std=c99
BIN= mysql_version  createdb createtable select last_row_id headers multiple_statement
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)   $< -o $@ `mysql_config --cflags --libs`

	
clean:
	rm -f *.o $(BIN) *.s
