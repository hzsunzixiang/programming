.PHONY: clean all

CC = gcc
CFLAGS = -Wall -g 
LDFLAGS = 
BIN1 = readwrite
BIN2 = sendfile

all: $(BIN1) $(BIN2)

#$(BIN1):$(BIN1).c
#	$(CC) $(CFLAGS) $(BIN1).c  $(LDFLAGS) -o $@
#
$(BIN2):$(BIN2).c
	$(CC) $(CFLAGS) $(BIN2).c  $(LDFLAGS) -o $@

clean:
	rm -f $(BIN1) $(BIN2) 

