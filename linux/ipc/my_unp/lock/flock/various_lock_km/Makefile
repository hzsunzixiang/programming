.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
#BIN=fcntl_flock fcntl_inherit fcntl_multi fcntl_unlock_close fcntl_unlock_exit flock_fcntl flock_inherit flock_multi flock_unlock_close flock_unlock_exit 
BIN=fcntl_multi flock_multi fcntl_unlock_exit  fcntl_unlock_close flock_unlock_close fcntl_inherit flock_inherit  flock_unlock_exit # fcntl_flock flock_fcntl 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $<  -o $@
clean:
	rm -f *.o $(BIN)
