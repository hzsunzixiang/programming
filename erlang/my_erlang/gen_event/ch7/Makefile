#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

#RUN_BIN=io_example
#RUN_BIN=freq_overload
#RUN_BIN=logger_my
RUN_BIN=counters_my
RUN_BIN=counters
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
