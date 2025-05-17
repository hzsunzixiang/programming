.PHONY: clean all

CC = gcc
CFLAGS = -Wall -g -I/usr/include/infiniband
#CFLAGS = -Wall -g -I/usr/include/
LDFLAGS = -libverbs
BIN = rc_pingpong
OBJ = pingpong.o

all: $(BIN)

$(BIN): $(OBJ) rc_pingpong.c
	$(CC) $(CFLAGS) rc_pingpong.c $(OBJ) $(LDFLAGS) -o $@

$(OBJ): pingpong.c pingpong.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(BIN) $(OBJ)

