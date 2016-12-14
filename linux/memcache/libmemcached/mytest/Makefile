
.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g
VPATH=../
INCLUDE = -I..

#./libmemcached/.libs/libmemcached.so
LIB = -L../libmemcached/.libs -lmemcached


#BIN=memcached_create memcached_server_add memcached_set memcached_get memcached_cas memcached_cas1
BIN=memcached_create memcached_server_add memcached_set memcached_get memcached_cas 
all:$(BIN)
%:%.c
	$(CC) $(CFLAGS)  $< $(LIB) $(INCLUDE) -o $@
clean:
	rm -f *.o $(BIN)


