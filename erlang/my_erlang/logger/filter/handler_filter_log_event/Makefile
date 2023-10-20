#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RUN_BIN=handler_filter_log_event
all:compile
	erl -noshell -kernel logger_sasl_compatible true -s $(RUN_BIN) start -s init stop


#erl -noshell -config sys_metadata -s $(RUN_BIN) start -s init stop
#erl -noshell -run $(RUN_BIN) start -s init stop
#erl -noshell -s nano_server start client -s init stop


compile:${MODS:%=%.beam} 

#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -f *.beam  erl_crash.dump
