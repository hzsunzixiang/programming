.PHONY:clean all
CC=gcc
CFLAGS=-Wall -g 

LIB_DIR=$(shell echo `erl -noshell -eval 'io:format(code:lib_dir()),erlang:halt()'`)


# 注意这里的路径，根据环境不同，有差异
#
ERL_INT_VERSION=5.4
INCLUDE = -I$(LIB_DIR)/erl_interface-$(ERL_INT_VERSION)/include -I../../../yajl_install/include/ 

LIB = -L$(LIB_DIR)/erl_interface-$(ERL_INT_VERSION)/lib/ -L../../../yajl_install//lib/ -lei_st -lyajl


BIN=jp_prog


all:$(BIN) 

$(BIN):%:%.c 
	$(CC) $(CFLAGS)  $^ $(LIB) $(INCLUDE) -o ../priv/$@
	export LD_LIBRARY_PATH=/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/yajl_install/lib/

clean:
	rm -f *.o $(BIN) ../priv/$(BIN)


#gcc -o ./priv/jp_prog -I/home/ericksun/program/otp-25.0.4/lib/erlang/lib/erl_interface-5.3/include -I/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/yajl_install/include/ -L/home/ericksun/program/otp-25.0.4/lib/erlang/lib/erl_interface-5.3/lib/ -L/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/yajl_install/lib/ c_src/jp_prog.c -lei_st -lyajl

#INCLUDE = -I/home/ericksun/program/otp-25.0.4/lib/erlang/lib/erl_interface-5.3/include -I/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/yajl_install/include/ 
