#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RUN_BIN=ets_update_op
RUN_BIN=ets_update_op_default
RUN_BIN=ets_update_op_list
RUN_BIN=ets_update_op_list_default
RUN_BIN=ets_update_incr
RUN_BIN=ets_update_incr_default
RUN_BIN=ets_deadlock
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
