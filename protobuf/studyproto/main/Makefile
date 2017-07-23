.PHONY:clean all
CC=g++
#CFLAGS=-Wall -save-temps -O1
CFLAGS=-Wall -g #-save-temps 
BIN= write_msg  write_msg_file write_msg_string
all:$(BIN)
%:%.cc 
	$(CC) $(CFLAGS)  addressbook.pb.cc  $< -o $@ -lprotobuf
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
