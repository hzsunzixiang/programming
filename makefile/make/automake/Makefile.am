
#noinst_LIBRARIES = libjupcommon.a  # PLV product list variable (PLV),
#libjupcommon_a_SOURCES = jupcommon.h print.c #   Product Source Variables


#BUILT_SOURCES = lexer.c
#AM_LFLAGS = -t
bin_PROGRAMS = count_words
count_words_SOURCES = count_words.c lexer.l 
count_words_LDADD = @LEXLIB@

#nodist_count_words_SOURCES = lexer.c  # PLV product list variable (PLV),
#CLEANFILES = lexer.c
#lexer.c: lexer.l
#	flex  -o lexer.c  lexer.l



#	echo "#define generated 1" > $@
