.PHONY:clean all
CC=g++
#CFLAGS=-Wall -save-temps -O1
CFLAGS=-Wall -g #-save-temps 
BIN= add_person list_people
all:$(BIN)
%:%.cc 
	$(CC) $(CFLAGS)  addressbook.pb.cc  $< -o $@ -lprotobuf
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
