
LIBS = ../libhiredis.a -levent 
CFLAGS =  -I..  -I../adapters

#SOURCE = example-ae.c example.c example-glib.c example-ivykis.c example-libev.c example-libevent.c example-libuv.c example-macosx.c 
SOURCE = example.c example-libevent.c
BIN = $(patsubst %.c,%.o,$(SOURCE))
all:$(BIN)
$(BIN): %.o: %.c
	@echo $(BIN)
	gcc -o $@ $(CFLAGS) $< $(LIBS) 



