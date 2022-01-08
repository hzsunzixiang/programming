#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RUN_BIN=spawn_1
RUN_BIN=dolphins
RUN_BIN=kitchen
RUN_BIN=multiproc
RUN_BIN=link
RUN_BIN=chain
RUN_BIN=monitor
RUN_BIN=register_name
RUN_BIN=register_name_restart
RUN_BIN=register_name_restart_ref
all:compile
	erl -noshell -s $(RUN_BIN) start -s init stop
	#erl -noshell -run $(RUN_BIN) start -s init stop
	#erl -noshell -s nano_server start client -s init stop


compile:${MODS:%=%.beam} 

#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -f *.beam
