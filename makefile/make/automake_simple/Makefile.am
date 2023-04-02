bin_PROGRAMS = count_words
count_words_SOURCES = count_words.c lexer.l 
count_words_LDADD = @LEXLIB@


#We use the CLEANFILES variable at to
#extend the list of files that Automake deletes during make clean.
CLEANFILES = lexer.c

## 因为 lex 已经内置了，所以可以不用这一行
## https://www.gnu.org/software/automake/manual/html_node/Built-Sources-Example.html
BUILT_SOURCES = lexer.c 



