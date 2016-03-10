BIN =  HelloWorld

FILES = HelloWorld.cpp


SRC = $(FILES) 
OBJ = $(FILES) 

LIBS = /usr/local/src/ACE_wrappers/lib/libACE.a 

CCFLAGS = -I./ 

BUILD = $(VBIN)

CC=g++


first_deps = first.cpp

CC = g++
INCL = $(ACE_ROOT)
LIBS = $(ACE_ROOT)/lib

.SUFFIXES: .cpp.o
.cpp.o:
	$(CC) -g -I$(INCL) -c $*.cpp

# -lpthread 最好加上 其他平台未必通的过
$(BIN): $(FILES)
	$(CC) -lpthread -ldl -lrt -I$(INCL) -L$(LIBS)  -o HelloWorld $(FILES) /usr/local/src/ACE_wrappers/lib/libACE.a 
#  -lACE 不行
#$(CC) -ldl -lrt -I$(INCL) -L$(LIBS)  -o HelloWorld $(FILES) /usr/local/src/ACE_wrappers/lib/libACE.a 

clean:
	-rm $(BIN)  -rf
