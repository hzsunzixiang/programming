.PHONY:clean all


BIN := $(patsubst %.erl,%, $(wildcard *.erl))

all:$(BIN)
%:%.erl
	erlc $< 

compile: clean
	erlc  $(BIN).erl

RUN_BIN=spawn
RUN_BIN=afile_server
RUN_BIN=afile_client_test
RUN_BIN=afile_client
run:
	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -f *.beam
