.PHONY:clean all
CC=g++ 

#CFLAGS = -std=c++11 -g --save-temps -Wdeprecated-declarations  -fpermissive -fno-elide-constructors
#CFLAGS = -std=c++11 -g --save-temps -Wdeprecated-declarations -fpermissive 
CFLAGS = -std=c++14 -g --save-temps -fpermissive -Wno-deprecated  -fno-elide-constructors
#CFLAGS = -std=c++11 -g --save-temps -fpermissive -Wno-deprecated  
BIN= main unordered_map
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
