test_nif
=====

An OTP library

Build
-----

    $ rebar3 compile


ericksun@centos7-dev:~/programming/erlang/my_erlang/external/ports/test_nif (master)$ rebar3 new cmake
===> Writing c_src/Makefile

ericksun@centos7-dev:~/programming/erlang/my_erlang/external/ports/test_nif (master)$ rebar3 shell
===> Verifying dependencies...
make: Entering directory `/home/ericksun/programming/erlang/my_erlang/external/ports/test_nif/c_src'
make: `/home/ericksun/programming/erlang/my_erlang/external/ports/test_nif/c_src/../priv/test_nif.so' is up to date.
make: Leaving directory `/home/ericksun/programming/erlang/my_erlang/external/ports/test_nif/c_src'
===> Analyzing applications...
===> Compiling test_nif
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1>
1>
1> test_nif:repeat(self(), hello).
ok
2> receive X -> X end.
hello
