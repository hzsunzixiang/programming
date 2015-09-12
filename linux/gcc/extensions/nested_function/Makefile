.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= main 
SOURCES = nested.c main.c

OBJECTS=$(SOURCES:.c=.o)

all:$(BIN)
$(BIN):$(OBJECTS)
	$(CC) $(CFLAGS)  $^ -o $@
clean:
	rm -f *.o $(BIN)

