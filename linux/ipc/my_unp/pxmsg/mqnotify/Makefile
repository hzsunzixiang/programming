.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= sigwait mqnotify_sigwait mq_notify_thread mq_notify_thread_loop
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  -lrt -o $@
clean:
	rm -f *.o $(BIN)

