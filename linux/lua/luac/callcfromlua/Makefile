.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g  -shared -fPIC -I/usr/include/lua5.1 -llua5.1

BIN=  hellofunc msleep
all:$(BIN)
hellofunc:hellofunc.c 
	$(CC) $(CFLAGS)   $<  -o power.so
msleep:mysleep.c 
	$(CC) $(CFLAGS)   $<  -o mysleep.so
	
clean:
	rm -f *.o $(BIN) *.s *.so
