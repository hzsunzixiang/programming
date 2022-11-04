.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g   -fpic -shared

#LIB_DIR=$(shell echo `erl -noshell -eval 'io:format(code:lib_dir()),erlang:halt()'`)
ERTS_INCLUDE_DIR ?= $(shell erl -noshell -eval "io:format(\"~ts/erts-~ts/include/\", [code:root_dir(), erlang:system_info(version)])." -s init stop)
ERL_INTERFACE_INCLUDE_DIR ?= $(shell erl -noshell -eval "io:format(\"~ts\", [code:lib_dir(erl_interface, include)])." -s init stop)
ERL_INTERFACE_LIB_DIR ?= $(shell erl -noshell -eval "io:format(\"~ts\", [code:lib_dir(erl_interface, lib)])." -s init stop)

#/home/ericksun/program/otp-25.0.4/lib/erlang/lib

INCLUDE = -I$(ERL_INTERFACE_INCLUDE_DIR) -I$(ERTS_INCLUDE_DIR) -I../../../../../../yajl_install/include/ 

LIB = -L$(ERL_INTERFACE_LIB_DIR) -L../../../../../../yajl_install/lib/ -lei_st -lyajl


BIN=jp_driver.so


all:$(BIN) 

$(BIN):$(patsubst %.so,%, $(wildcard *.c))
	$(CC) $(CFLAGS)  $^ $(LIB) $(INCLUDE) -o ../priv/$@

clean:
	rm -f *.o $(BIN) ../priv/$(BIN)

#gcc -o ./priv/jp_driver.so -fpic -shared -I/home/ericksun/program/otp-25.0.4/lib/erlang/erts-13.0.4/include  -I/home/ericksun/program/otp-25.0.4/lib/erlang/lib/erl_interface-5.3/include -I/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/plain_port/json_parser/yajl_install/include/ -L/home/ericksun/program/otp-25.0.4/lib/erlang/lib/erl_interface-5.3/lib/ -L/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/plain_port/json_parser/yajl_install/lib/ c_src/jp_driver.c -lei_st -lyajl
