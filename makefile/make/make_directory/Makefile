

count_words: count_words.o counter.o lexer.o -lfl
	gcc $^ -o $@

count_words.o: src/count_words.c include/counter.h
	gcc -c $< 

counter.o: src/counter.c include/counter.h include/lexer.h
	gcc -c $< -o $@

lexer.o: src/lexer.c include/lexer.h
	gcc -c $< -o $@ 

lexer.c: src/lexer.l
	flex -t $< >$@ 

.PHONY:clean
clean:
	rm -f count_words *.o *.so src/lexer.c

# 最好加上头文件依赖，否则，头文件改变时，不会进行更新
