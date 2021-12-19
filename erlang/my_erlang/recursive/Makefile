.PHONY:clean all

all: compile
#BIN=fac
#BIN=fib
#BIN=len
BIN=reverse
#BIN=duplicate
compile: clean
	erlc  $(BIN).erl

run:
	erl -s $(BIN) start -noshell -s init stop

clean:
	rm -f *.beam
