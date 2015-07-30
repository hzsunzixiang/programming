.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= sigwait mqnotify_sigwait mq_notify_thread
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  -lrt -o $@
clean:
	rm -f *.o $(BIN)

