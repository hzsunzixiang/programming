
#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -E -W $<
	erlc -S -W $<
	erlc -W $<

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RUN_BIN=hello
all:compile
	erl -noshell -s $(RUN_BIN) start -s init stop
	#erl -noshell -s nano_server start client -s init stop


compile:${MODS:%=%.beam} 

#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -f *.beam
