.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= label 
SOURCES = label.c

OBJECTS=$(SOURCES:.c=.o)

all:$(BIN)
$(BIN):$(OBJECTS)
	$(CC) $(CFLAGS)  $^ -o $@
clean:
	rm -f *.o $(BIN)

