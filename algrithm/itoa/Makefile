.PHONY:clean all
CC=g++
#CFLAGS=-Wall -save-temps -O1
CXXFLAGS=-Wall -g -save-temps
#BIN=  main main1 main_my
BIN= itoa   itoa_my atoi
all:$(BIN)
%:%.c 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.i *.ii
