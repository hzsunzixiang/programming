.PHONY: clean all

CC = gcc
CFLAGS = -Wall -g 
LDFLAGS = 
BIN = user_program
BIN = netlink

all: $(BIN)

$(BIN):
	$(CC) $(CFLAGS) $(BIN).c  $(LDFLAGS) -o $@

clean:
	rm -f $(BIN) $(OBJ)

