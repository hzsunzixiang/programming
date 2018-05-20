

# 这个例子说明 可以把main函数直接放到lib中
# https://stackoverflow.com/questions/31421616/c-creating-static-library-and-linking-using-a-makefile
# ar -t libmylib.a

all: myProgram

myProgram: it.o libmylib.a #libmylib.a is the dependency for the executable
	gcc -lm -o myProgram it.o -L. -lmylib

main.o: main.c
	gcc -O -c main.c 

it.o: it.c it.h
	gcc -O -c it.c

libmylib.a: main.o #let's link library files into a static library
	ar rcs libmylib.a main.o

libs: libmylib.a

clean:
	rm -rf myProgram *.o *.a *.gch #This way is cleaner than your clean
