ericksun@centos7-mq1:~/programming/makefile/make/make_rules/implicit_rules (master)$ make -n foo
yacc  foo.y
mv -f y.tab.c foo.c
cc    -c -o foo.o foo.c
cc   foo.o   -o foo
rm foo.c foo.o

