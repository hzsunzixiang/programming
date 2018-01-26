#
.PHONY:clean all
CC=g++
CFLAGS=-Wall -g -std=c++11 -W -Wall -pedantic
BIN= max  implicit ambiguous isclasst SFINAE SFINAE_error SFINAE_right type_arguments notype_arguments notype_arguments_error template_template_arguments
all:$(BIN)
%:%.cpp
	$(CC) $(CFLAGS)   $< -o $@

clean:
	rm -f *.o $(BIN) *.s
