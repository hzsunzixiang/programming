BIN =  server client


#LIBS = /usr/local/src/ACE_wrappers/lib/libACE.a 


CC = g++
INCL = $(ACE_ROOT)
LIBS = $(ACE_ROOT)/lib
CCFLAGS = -g -I./  -save-temps

GCCVER := $(shell $(CC) -dumpversion | awk -F. '{ print $$1"."$$2}' )

ifeq ($(GCCVER) , 4.4)
CCFLAGS += -D__GCC44__
else
CCFLAGS += -D__GCC41__
endif

#.SUFFIXES: .cpp.o
#.cpp.o:
#	$(CC) $(CCFLAGS) -save-temps -g -I$(INCL) -c $*.cpp

# -lpthread 最好加上 其他平台未必通的过
.PHONY:clean all

all:$(BIN)
%:%.cpp 
	$(CC) -save-temps -g  -lpthread -ldl -lrt -I$(INCL) -L$(LIBS)  -o $@ $<  /usr/local/src/ACE_wrappers/lib/libACE.a 

#  -lACE 不行
#$(CC) -ldl -lrt -I$(INCL) -L$(LIBS)  -o HelloWorld $(FILES) /usr/local/src/ACE_wrappers/lib/libACE.a 

clean:
	rm -f *.o $(BIN) *.s *.ii



