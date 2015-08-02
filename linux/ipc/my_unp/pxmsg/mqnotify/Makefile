.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
BIN= sigwait mqnotify_sigwait mq_notify_thread mq_notify_thread_loop mqnotify_sig_err1 \
	 mqnotify_sig_correct mqnotify_sig_err0 mqnotify_sig_pipe

all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  -lrt -o $@
clean:
	rm -f *.o $(BIN)

