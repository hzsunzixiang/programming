
Makefile-double-colon:35: warning: overriding recipe for target `libcounter.a'
Makefile-double-colon:32: warning: ignoring old recipe for target `libcounter.a'
cc  -I inlcude  -c -o count_words.o src/count_words.c
cc  -I inlcude  -c -o counter.o common/counter.c
lex  -t common/lexer.l > lexer.c
cc  -I inlcude  -c -o lexer.o lexer.c
ar rv libcounter.a counter.o
ar: creating libcounter.a
a - counter.o
cc   count_words.o libcounter.a /usr/lib64/libfl.a   -o count_words
count_words.o: In function `main':
count_words.c:(.text+0x5): undefined reference to `yylex'
libcounter.a(counter.o): In function `counter':
counter.c:(.text+0xe): undefined reference to `yylex'
counter.c:(.text+0x22): undefined reference to `fee_count'
counter.c:(.text+0x36): undefined reference to `fie_count'
counter.c:(.text+0x46): undefined reference to `foe_count'
collect2: error: ld returned 1 exit status
make: *** [count_words] Error 1
rm lexer.c

