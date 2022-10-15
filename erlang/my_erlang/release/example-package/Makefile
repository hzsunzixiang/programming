#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RUN_BIN=handle_release
all:compile
	bash find_the_version.sh
	erl -noshell -s $(RUN_BIN) start -s init stop
	cp start.sh ernie

compile:${MODS:%=%.beam} 
	mkdir -p ernie
	cd bsc/src && make 

#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -rf rm *.script *.boot *.beam ernie
	cd bsc/src && make clean
