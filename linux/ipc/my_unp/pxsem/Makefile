.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= semcreate sem_timedwait semunlink semgetvalue semwait sempost
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  -pthread -o $@
clean:
	rm -f *.o $(BIN)

