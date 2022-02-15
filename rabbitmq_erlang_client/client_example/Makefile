#.PHONY:clean all
.SUFFIXES: .erl .beam

.erl.beam:
	erlc  -I ../amqp_client/include/ -I ../amqp_client/deps/  -pa  ../amqp_client/deps/rabbit_common/ebin/ -pa ../amqp_client/ebin/  -pa ../amqp_client/src/ -W $<
	#erlc  -I ~/programming/rabbitmq_erlang_client/amqp_client/include/  -pa  ~/programming/rabbitmq_erlang_client/amqp_client/deps/rabbit_common/ebin/  -W $<
	#erlc  -I ../amqp_client/include/  -pa  ../amqp_client/deps/rabbit_common/ebin/ -pa ../amqp_client/ebin/ -W $<
	#erlc  -I ../amqp_client/include/  -pa  ../amqp_client/deps/rabbit_common/ebin/  -pa ../amqp_client/src/ -W $<
	#erlc  -I ../amqp_client/include/  -pa  ../amqp_client/deps/rabbit_common/ebin/ -pa ../amqp_client/ebin/ -E  $<


ERL = erl -boot start_clean

MODS := $(patsubst %.erl,%, $(wildcard *.erl))

#RUN_BIN=amqp_example_send
RUN_BIN=amqp_example_receive
all:compile
	erl -noshell -pa  ../amqp_client/deps/rabbit_common/ebin/  -pa ../amqp_client/ebin/ -s $(RUN_BIN) start_my -s init stop


compile:${MODS:%=%.beam} 

#RUN_BIN=hello
#run:
#	erl -noshell -s $(RUN_BIN) start  -s init stop

clean:
	rm -f *.beam
