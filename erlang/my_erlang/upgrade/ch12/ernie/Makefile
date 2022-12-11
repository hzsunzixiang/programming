#.PHONY:clean all
.SUFFIXES: .erl .beam


.erl.beam:
	erlc -W $<

ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

RELEASE_NAME=coffee

RUN_BIN=handle_release
all:dir_name compile
	erl -noshell -s $(RUN_BIN) start -s init stop
	cp start.sh ${RELEASE_NAME}_heart ${RELEASE_NAME}_release 

dir_name:
	bash find_the_version.sh

compile:${MODS:%=%.beam}
	erlc $(RUN_BIN).erl
	mkdir -p ${RELEASE_NAME}_release
	cd ${RELEASE_NAME}/src && make 


#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -rf rm *.script *.boot *.beam ${RELEASE_NAME}_release start.sh  ${RELEASE_NAME}.rel 
	cd ${RELEASE_NAME}/src && make clean
