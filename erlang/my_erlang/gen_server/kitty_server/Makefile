#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RUN_BIN=kitty_gen_server_by_server_name_global
RUN_BIN=kitty_gen_server_by_pid
RUN_BIN=kitty_gen_server_by_server_name_local
RUN_BIN=kitty_gen_server_by_server_name_via_global
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
