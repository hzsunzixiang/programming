.PHONY: clean all

CC = gcc
CFLAGS = -Wall -g -I/usr/include/infiniband
#CFLAGS = -Wall -g -I/usr/include/
LDFLAGS = -libverbs
BIN = ibv_rc_pingpong 

all: $(BIN)

$(BIN): rc_pingpong.c
	$(CC) $(CFLAGS) rc_pingpong.c $(OBJ) $(LDFLAGS) -o $@

clean:
	rm -f $(BIN) $(OBJ)

