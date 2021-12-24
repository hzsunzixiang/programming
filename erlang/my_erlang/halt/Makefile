.PHONY:clean all


BIN=fac fib len reverse duplicate sublist quicksort zip

all:$(BIN)
%:%.erl
	erlc $< 

compile: clean
	erlc  $(BIN).erl

RUN_BIN=zip
run:
	erl -s $(RUN_BIN) start -noshell -s init stop

clean:
	rm -f *.beam
