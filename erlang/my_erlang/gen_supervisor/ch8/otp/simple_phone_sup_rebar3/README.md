simple_phone_sup_rebar3
=====

dynamic children simple_one_for_one rebar3

Build
-----

    $ rebar3 compile
ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_supervisor/ch8/otp/simple_phone_sup_rebar3 (master)$ rebar3 shell
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling simple_phone_sup_rebar3
apps/simple_phone_sup_rebar3/src/simple_phone_sup_rebar3_sup.erl:25:1: Warning: function stop/0 is unused

Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> ===> Booted simple_phone_sup_rebar3
===> Booted sasl
1> observer:start().
ok
2> simple_phone_sup:attach_phone(1).
{ok,<0.209.0>}
3> simple_phone_sup:attach_phone(2).
{ok,<0.212.0>}
4> simple_phone_sup:attach_phone(3).
{ok,<0.234.0>}

