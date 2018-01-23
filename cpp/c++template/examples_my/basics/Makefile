# include ../Makefile.h
#
.PHONY:clean all
CC=g++
#CFLAGS=-Wall -g -ansi -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wtraditional -pedantic
CFLAGS=-Wall -g -ansi -W -Wall -pedantic
BIN= max2 max3 \
     stack1test stack2test stack3test \
     stack4test addvaltest \
     stack5test stack6test \
     myfirstinst\
     printcolltest
#stack5test stack6test stack7test
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
	
