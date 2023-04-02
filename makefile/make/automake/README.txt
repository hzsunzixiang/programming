/bin/sh ./ylwrap lexer.l lex.yy.c lexer.c -- flex


ericksun@centos7-mq1:~/programming/makefile/make/automake (master)$ make
make  all-am
make[1]: Entering directory `/home/ericksun/programming/makefile/make/automake'
gcc -DHAVE_CONFIG_H -I.     -g -O2 -MT count_words.o -MD -MP -MF .deps/count_words.Tpo -c -o count_words.o count_words.c
mv -f .deps/count_words.Tpo .deps/count_words.Po
/bin/sh ./ylwrap lexer.l lex.yy.c lexer.c -- flex
gcc -DHAVE_CONFIG_H -I.     -g -O2 -MT lexer.o -MD -MP -MF .deps/lexer.Tpo -c -o lexer.o lexer.c
mv -f .deps/lexer.Tpo .deps/lexer.Po
gcc  -g -O2   -o count_words count_words.o lexer.o -lfl -lfl
make[1]: Leaving directory `/home/ericksun/programming/makefile/make/automake'
