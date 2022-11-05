example1
=====

An OTP library

Build
-----

    $ rebar3 compile



ericksun@centos7-dev:~/programming/erlang/my_erlang/external/ports/example1 (master)$ rebar3 shell
===> Verifying dependencies...
make: Entering directory `/home/ericksun/programming/erlang/my_erlang/external/ports/example1/c_src'
gcc -o ../priv/example1 example1.c erl_comm.c example1_driver.c
make: Leaving directory `/home/ericksun/programming/erlang/my_erlang/external/ports/example1/c_src'
===> Analyzing applications...
===> Compiling example1
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> example1:start().
true
2> example1:sum(45, 32).
77
3> example1:twice(10).
20

