.PHONY: clean all

CC = gcc
CFLAGS = -Wall -g 
LDFLAGS = 
BIN = netlink_for_loop
BIN = nl_user

all: $(BIN)

$(BIN):$(BIN).c
	$(CC) $(CFLAGS) $(BIN).c  $(LDFLAGS) -o $@

clean:
	rm -f $(BIN) 

