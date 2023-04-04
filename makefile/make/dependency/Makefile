

VPATH = src include

CPPFLAGS = -I include

SOURCES = count_words.c \
		  lexer.c \
		  counter.c
count_words:counter.o lexer.o -lfl

count_words.o:counter.h

counter.o:counter.h lexer.h

lexer.o:lexer.h

include $(subst .c,.d,$(SOURCES))

%.d: %.c
	$(CC) -M $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

.PHONY:clean
clean:
	rm -f *.o lexer.c  count_words *.d *.d.*

#lexer.c: lexer.l
#	flex -t $< >$@ 

## 默认规则中就有 所以上面的规则可以省略
#%.c: %.l
##  recipe to execute (built-in):
#	@$(RM) $@ 
#	 $(LEX.l) $< > $@


