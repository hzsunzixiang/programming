.PHONY:clean all
CC=g++ 

#CFLAGS = -std=c++11 -g --save-temps -Wdeprecated-declarations  -fpermissive -fno-elide-constructors
#CFLAGS = -std=c++11 -g --save-temps -Wdeprecated-declarations -fpermissive 
CFLAGS = -std=c++11 -g --save-temps -fpermissive -Wno-deprecated  -fno-elide-constructors
#CFLAGS = -std=c++11 -g --save-temps -fpermissive -Wno-deprecated  
BIN= move  string auto_ptr auto_ptr1 unique_ptr unique_ptr1 unique_ptr2 unique_ptr3 unique_ptr4
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
