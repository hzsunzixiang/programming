CPPFLAGS=-g -Wall
main:main.o libggg.so
libggg.so:get.h
	g++ get.cpp -shared -g -fPIC -DDEBUG -o libggg.so


.PHONY:clean
clean:
	rm -f *.so main *.o
	
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`pwd`

