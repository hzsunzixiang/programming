.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g

#BIN=test1 test2
BIN=test1
all:$(BIN)

%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@ -lpthread
test1:test1.o task.o
	$(CC) $(CFLAGS) -o test1 test1.o task.o -lpthread
#test2:test2.o task.o
#	$(CC) $(CFLAGS) -o test2 test2.o task.o -lpthread

clean:
	rm -f *.o  main




