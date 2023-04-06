VPATH=src include

CPPFLAGS = -I include
#
count_words: count_words.o counter.o lexer.o -lfl
	gcc $(CPPFLAGS) $^ -o $@

count_words.o: count_words.c counter.h
	gcc $(CPPFLAGS) -c $< 

counter.o: counter.c counter.h lexer.h
	gcc $(CPPFLAGS) -c $< -o $@

lexer.o: lexer.c lexer.h
	gcc $(CPPFLAGS) -c $< -o $@ 

lexer.c: lexer.l
	flex -t $< >$@ 

.PHONY:clean
clean:
	rm -f count_words *.o *.so lexer.c

# 最好加上头文件依赖，否则，头文件改变时，不会进行更新
