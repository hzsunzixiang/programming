



all: myProgram

myProgram: main.o libmylib.a #libmylib.a is the dependency for the executable
	gcc -lm -o myProgram main.o -L. -lmylib

main.o: main.c
	gcc -O -c main.c 

it.o: it.c it.h
	gcc -O -c it.c

libmylib.a: it.o #let's link library files into a static library
	ar rcs libmylib.a it.o

libs: libmylib.a

clean:
	rm -f myProgram *.o *.a *.gch #This way is cleaner than your clean
