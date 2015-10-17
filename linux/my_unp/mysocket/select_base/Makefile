.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
#BIN=echosrv echocli
BIN=select_base pselect_base pselect_signal pselect_signal1 select_forward_port
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

