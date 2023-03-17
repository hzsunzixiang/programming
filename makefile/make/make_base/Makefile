
# 最原始的makefile
# 首先安装flex及其库文件
#root@debian:~/programming/makefile/make/make1# aptitude  install  flex flexc++
count_words:count_words.o lexer.o -lfl
	gcc count_words.o lexer.o -lfl -o count_words
count_words.o:count_words.c
	gcc -c count_words.c
lexer.o:lexer.c
	gcc -c lexer.c
lexer.c:lexer.l
	flex -t lexer.l>lexer.c
.PHONY:clean install_flex
clean:
	rm -f *.o lexer.c

install_flex:
	sudo yum install flex-devel.x86_64 flex.x86_64
