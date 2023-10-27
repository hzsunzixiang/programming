#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RUN_BIN=create_tables
all:compile
	erl -noshell -mnesia dir '"./mnesia_store"' -sname apple -s $(RUN_BIN) start -s init stop


compile:${MODS:%=%.beam} 

#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -f *.beam erl_crash.dump
#erl -noshell -run $(RUN_BIN) start -s init stop
#erl -noshell -s nano_server start client -s init stop
