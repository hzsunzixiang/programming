.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= ctl  msgcreate msgrcv msgrcvid msgsnd msgrmid
all:$(BIN)
%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f *.o $(BIN)

