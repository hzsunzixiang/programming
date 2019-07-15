.PHONY:clean all
CC=g++ 

CXXFLAGS = -std=c++11 -g --save-temps -fpermissive -Wno-deprecated  -fno-elide-constructors -lcurl

BIN= curl_version  https
all:$(BIN)
%:%.cpp 
	$(CC) $(CXXFLAGS)   $< -o $@

%:%.c 
	$(CC) $(CXXFLAGS)   $< -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
