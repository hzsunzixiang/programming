.PHONY: clean all

CC = gcc
CFLAGS = -Wall -g -I/usr/include/infiniband
#CFLAGS = -Wall -g -I/usr/include/
LDFLAGS = -libverbs  -lrdmacm
BIN = rdma_server

all: $(BIN)

$(BIN):  
	$(CC) $(CFLAGS)  $(BIN).c $(LDFLAGS) -o $@


clean:
	rm -f $(BIN) $(OBJ)

