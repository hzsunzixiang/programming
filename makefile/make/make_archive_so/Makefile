#. $ gcc -o lt.o -c lt.c 2. $ gcc -shared -Wall -fPIC -o liblt.so lt.o -shared
#链接方法II，手动指定库路径1. $ cc -o test test.o -llt -B /path/to/lib这里的-B 选项就添加 /path/to/lib 到gcc搜索的路径之中。这样链接没有问题但是方法II中手动链接好的程序在执行时候仍旧需要指定库路径(链接和执行是分开的)。需要添加系


# 生成的可执行文件运行不出结果，需要查一下

##-Bstatic
#-Bdynamic
#These options are passed down to the linker. They are defined for compatibility with Diab.

#http://www.manpages.info/linux/gcc.1.html
# -Bprefix
#	   This option specifies where to find the executables, libraries,
#	   include files, and data files of the compiler itself.

#-Ldir
#	   Add directory dir to the list of directories to be searched for -l.

CPPFLAGS=-I inlcude
VPATH=src include 
# 依赖条件 count_words.o是必须的
# 如果使用默认匹配规则（见另外一个makefile），则不用，否则必须加上
count_words: count_words.o libcounter.so  -lfl
# 下面这个通不过 ,必须用简写?
#gcc -o count_words -B ./lib libcounter.so  -lfl
# 下面的几个都可以
#gcc -o count_words -B ./lib -lcounter  -lfl
	gcc -o count_words count_words.o lib/libcounter.so -lfl
#gcc -o count_words -L ./lib -lcounter  -lfl
#注意这里，不要丢掉count_words.o的依赖条件，不然运行没有结果.
#因为这里不是默认规则，所以不会自动匹配count_words.o
#gcc -o count_words count_words.o lib/libcounter.so  -lfl
libcounter.so:lexer.o counter.o
#gcc -shared -Wall -fPIC  -o lib/libcounter.so lexer.o counter.o
	gcc -shared -Wall -fPIC  -o lib/libcounter.so lexer.o counter.o
count_words.o:counter.h
counter.o:counter.h lexer.h
lexer.o:lexer.h
.PHONY:clean
clean:
	rm -f *.o src/lexer.c  *.so lib/*.so count_words




# 这种情形下，如下两种环境变量都可以， 会自动去 lib下面找？
# export LD_LIBRARY_PATH=`pwd`
# export LD_LIBRARY_PATH=`pwd`/lib









