.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= read_intr0  read_intr read_intr_signal
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)
