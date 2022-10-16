#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RUN_BIN=handle_release
all:dir_name compile
	erl -noshell -s $(RUN_BIN) start -s init stop
	cp start.sh ernie

dir_name:
	bash find_the_version.sh

compile:${MODS:%=%.beam}
	erlc $(RUN_BIN).erl
	mkdir -p ernie
	cd bsc/src && make 


#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -rf rm *.script *.boot *.beam ernie start.sh  basestation.rel handle_release.erl
	cd bsc/src && make clean
