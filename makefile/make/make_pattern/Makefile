

VPATH = src include

CPPFLAGS = -I include

count_words:counter.o lexer.o -lfl

count_words.o:counter.h

counter.o:counter.h lexer.h

lexer.o:lexer.h


.PHONY:clean
clean:
	rm -f *.o lexer.c  count_words

#lexer.c: lexer.l
#	flex -t $< >$@ 

## 默认规则中就有 所以上面的规则可以省略
#%.c: %.l
##  recipe to execute (built-in):
#	@$(RM) $@ 
#	 $(LEX.l) $< > $@

