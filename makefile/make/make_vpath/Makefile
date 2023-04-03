
# 每一行只能一个，不能合并 比如 vpath %.l %.c src 
vpath %.l src
vpath %.c src
vpath %.h include

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

## 默认规则中就有 所以上面的规则可以省略
#%.c: %.l
##  recipe to execute (built-in):
#	@$(RM) $@ 
#	 $(LEX.l) $< > $@


.PHONY:clean
clean:
	rm -f count_words *.o *.so lexer.c

# 最好加上头文件依赖，否则，头文件改变时，不会进行更新
