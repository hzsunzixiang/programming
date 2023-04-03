
# 最原始的makefile
# 首先安装flex及其库文件
#root@debian:~/programming/makefile/make/make1# aptitude  install  flex flexc++
count_words:count_words.o lexer.o counter.o -lfl
	gcc count_words.o lexer.o counter.o -lfl -o count_words

#counter.o: counter.c counter.h lexer.h
#	gcc -c counter.c
#

# 上面的规则拆成这两个
counter.o: counter.h lexer.h
counter.o:counter.c
	gcc -c counter.c

count_words.o:count_words.c
	gcc -c count_words.c


lexer.o:lexer.c
	gcc -c lexer.c

lexer.c:lexer.l
	flex -o lexer.c lexer.l


.PHONY:clean install_flex
clean:
	rm -f *.o lexer.c

install_flex:
	sudo yum install flex-devel.x86_64 flex.x86_64
