.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g  -shared -fPIC -I/usr/include/lua5.1 -llua5.1

BIN= mysin mylib
all:$(BIN)

mysin:l_sin.c 
	$(CC) $(CFLAGS)   $<  -o mysin.so
	
mylib:l_dir.c 
	$(CC) $(CFLAGS)   $<  -o mylib.so
clean:
	rm -f *.o $(BIN) *.s *.so
