
# 本代码是最原始的代码，应该是首先要演示的，一个完整的代码
count_words:count_words.o counter.o lexer.o -lfl
	gcc $^ -o $@
count_words.o:src/count_words.c include/counter.h
	gcc -c $< -o $@
counter.o:src/counter.c include/counter.h include/lexer.h
	gcc -c $< -o $@
lexer.o:src/lexer.c include/lexer.h
	gcc -c $< -o $@ 
lexer.c:src/lexer.l
	flex -t $< >$@ 
.PHONY:clean
clean:
	rm -f *.o src/lexer.c count_words

