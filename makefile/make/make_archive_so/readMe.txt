 export LD_LIBRARY_PATH=`pwd`/lib 
./count_words< src/lexer.l 


gcc count_words.o -L. -lcounter -lfl
