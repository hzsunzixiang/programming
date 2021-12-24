.PHONY:clean all run compile

# https://makefiletutorial.com/#multiple-targets
all: compile

#BIN=add incr_decr
BIN := $(patsubst %.erl,%, $(wildcard *.erl))

compile:$(BIN) 
%:%.erl
	erlc $< 

# 编译的同时 运行
#	erl -s $@ start -noshell -s init stop

#run:$(BIN) 
#%:%.beam
#	erl -s $@ start -noshell -s init stop

RUN_BIN=add
RUN_BIN=incr_decr
RUN_BIN=close
run:
	erl -s $(RUN_BIN) start -noshell -s init stop


clean:
	@rm -rf $@.beam 
