objects = foo.o bar.o

all: $(objects)

$(objects): %.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

.PHONEY:clean
clean:
	rm  -f *.o foo

#https://www.gnu.org/software/make/manual/html_node/Static-Usage.html#Static-Usage	

#root@debian:~/programming/makefile/make/make_pattern# make
#cc -c  foo.c -o foo.o
#cc -c  bar.c -o bar.o
#root@debian:~/programming/makefile/make/make_pattern# make clean
#rm  -f *.o
#root@debian:~/programming/makefile/make/make_pattern# make foo
#cc -c  foo.c -o foo.o
#cc   foo.o   -o foo
#root@debian:~/programming/makefile/make/make_pattern# make clean
#rm  -f *.o
#root@debian:~/programming/makefile/make/make_pattern# make foo.o
#cc -c  foo.c -o foo.o
#root@debian:~/programming/makefile/make/make_pattern# make bar.o
#cc -c  bar.c -o bar.o
#root@debian:~/programming/makefile/make/make_pattern# make clean
#rm  -f *.o
#root@debian:~/programming/makefile/make/make_pattern# make bar
#cc -c  bar.c -o bar.o
#cc   bar.o   -o bar
#/usr/lib/gcc/i486-linux-gnu/4.7/../../../i386-linux-gnu/crt1.o: In function `_start':
#(.text+0x18): undefined reference to `main'
#collect2: error: ld returned 1 exit status
#make: *** [bar] Error 1
#
