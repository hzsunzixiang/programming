.PHONY:clean all
CC=g++
CFLAGS=-Wall -g --save-temps
BIN= Point3d  name_mangling Point3d_virtual Point3d_static const_fun
all:$(BIN)
%:%.cpp 
	$(CC) $(CFLAGS)   $< -lm -o $@
	
clean:
	rm -f *.o $(BIN) *.s *.ii
