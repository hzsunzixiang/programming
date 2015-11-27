.PHONY:clean all
CPP=g++
CPPFLAGS=-Wall -g  --save-temps
BIN= classDepend  callDerivedFromBase
all:$(BIN)
%:%.cpp
	$(CPP) $(CPPFLAGS) $< -o $@
clean:
	rm -f *.o $(BIN) *.ii *.s
