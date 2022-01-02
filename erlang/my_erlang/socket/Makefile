
#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RUN_BIN=socket_examples_1
RUN_BIN=nano_server
RUN_BIN=nano_server_active_false
RUN_BIN=nano_server_active_true
all:compile
	erl -noshell -s $(RUN_BIN) start -s init stop
	#erl -noshell -s nano_server start client -s init stop


compile:${MODS:%=%.beam} 

#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -f *.beam
