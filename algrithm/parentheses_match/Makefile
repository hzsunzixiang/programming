.PHONY:clean all
CC=g++
#CFLAGS=-Wall -save-temps -O1
CPPFLAGS=-Wall -g -save-temps
#BIN=  main main1 main_my
BIN=  main main_my  main_my2
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
