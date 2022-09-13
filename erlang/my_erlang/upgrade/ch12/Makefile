#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

#RUN_BIN=handle_release_appup
RUN_BIN=handle_release
all:compile
	erl -noshell -s $(RUN_BIN) start -s init stop
	cp start.sh ernie
	#erl -noshell -run $(RUN_BIN) start -s init stop
	#erl -noshell -s nano_server start client -s init stop


compile:${MODS:%=%.beam} 
	mkdir -p ernie

#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -rf rm *.script *.boot *.beam ernie
