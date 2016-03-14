.PHONY:clean all
CC=g++
CFLAGS=-Wall -g
#BIN= extern1 extern2  extern3 extern4 extern5
#BIN= extern1 extern2  extern3  extern6.0  extern6.1 extern6.2 extern7.0 extern7.1 extern8.0 extern8.1
BIN= extern1 extern2  extern3  extern6.0  extern6.1 extern6.2 extern7.0 extern7.1 extern8.1 
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s
