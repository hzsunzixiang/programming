#
.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -std=c++11 -W -Wall -pedantic -Wno-enum-compare 
BIN= accum1 accum2 accum3 accum4 accum5 accum6 accum7 accum8 sizeof elementtype isclasst apply1 apply2 rparam1 rparam2
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
