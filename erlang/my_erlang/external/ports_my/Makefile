.SUFFIXES: .erl .beam .yrl

ERTS_INCLUDE_DIR ?= $(shell erl -noshell -eval "io:format(\"~ts/erts-~ts/include/\", [code:root_dir(), erlang:system_info(version)])." -s init stop)
ERL_INTERFACE_INCLUDE_DIR ?= $(shell erl -noshell -eval "io:format(\"~ts\", [code:lib_dir(erl_interface, include)])." -s init stop)
ERL_INTERFACE_LIB_DIR ?= $(shell erl -noshell -eval "io:format(\"~ts\", [code:lib_dir(erl_interface, lib)])." -s init stop)


CFLAGS += -fPIC -I $(ERTS_INCLUDE_DIR) -I $(ERL_INTERFACE_INCLUDE_DIR)
CXXFLAGS += -fPIC -I $(ERTS_INCLUDE_DIR) -I $(ERL_INTERFACE_INCLUDE_DIR)

LDLIBS += -L $(ERL_INTERFACE_LIB_DIR) -lei
LDFLAGS += -shared

.erl.beam:
	erlc -W $<

MODS = example1 example1_lid unit_test

all: 	 ${MODS:%=%.beam} example1 example1_drv.so
	@erl -noshell -s unit_test start

example1:  example1.c erl_comm.c example1_driver.c
	gcc -o example1 example1.c erl_comm.c example1_driver.c

example1_drv.so: example1_lid.c example1.c
	gcc $(CFLAGS) $(LDFLAGS) -o example1_drv.so example1.c example1_lid.c

#example1_drv.so: example1_lid.c example1.c
#	gcc -I /usr/local/lib/erlang/usr/include\
#            -o example1_drv.so -fpic -shared example1.c example1_lid.c

clean:
	rm example1 example1_drv.so *.beam -rf



