
#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RUN_BIN=records
RUN_BIN=records_1
RUN_BIN=records_2
RUN_BIN=records_3
RUN_BIN=records_4
RUN_BIN=records_5
RUN_BIN=records_6
RUN_BIN=records_7
RUN_BIN=records_8
RUN_BIN=records_9
all:compile
	erl -noshell -s $(RUN_BIN) start -s init stop
	#erl -noshell -run $(RUN_BIN) start -s init stop
	#erl -noshell -s nano_server start client -s init stop


compile:${MODS:%=%.beam} 

#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -f *.beam *.dump
