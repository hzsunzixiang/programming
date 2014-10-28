test:test.o libit.so
test.o:test.c
libit.so:it.o
	gcc -shared -Wall -fPIC -o libit.so it.o
it.o: it.c it.h
:PHNOY clean
clean:
	-rm *.o *.so
:PHNOY setenv
setenv:
	export LD_LIBRARY_PATH=`pwd`

