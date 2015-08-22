.PHONY:clean all
AS=as
CFLAGS=-Wall -g
SOURCE=helloworld.s
BIN=helloworld
OBJ=helloworld.o
all:$(BIN)
%:%.s
	as  $(SOURCE) --gstabs -o $(OBJ)  # --gstabs会加上符号表
#ld -s -o $(BIN) $(OBJ)  # -s会去掉符号表
	ld  -o $(BIN) $(OBJ)
	
clean:
	rm -f *.o $(BIN)  $(OBJ)

