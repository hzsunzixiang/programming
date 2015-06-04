.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
#BIN=echosrv echocli
BIN=echosrv  echocli abort_client dos_attach 
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

