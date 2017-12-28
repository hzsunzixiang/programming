.PHONY:clean all
CC=g++
#CFLAGS=-Wall -save-temps -O1
CXXFLAGS=-Wall -g -save-temps
#BIN=  main main1 main_my
BIN= inet_aton  inet_aton1 inet_aton_my inet_aton_1
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
