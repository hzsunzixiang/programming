myapp
=====

An OTP application

Build
-----

    $ rebar3 compile

elli - Erlang web server for HTTP APIs
https://hexdocs.pm/elli/3.1.0/index.html


ericksun@centos-1:~/programming/erlang/my_erlang/rebar3/myapp (master)$ rebar3 compile
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling myapp
ericksun@centos-1:~/programming/erlang/my_erlang/rebar3/myapp (master)$ rebar3 shell
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling myapp
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]

Eshell V12.2  (abort with ^G)
1> ===> Booted myapp

1>
1> {ok, Pid} = elli:start_link([{callback, elli_example_callback}, {port, 3000}]).
{ok,<0.184.0>}
2>

handle('GET',[<<"hello">>, <<"world">>], _Req) ->
curl  127.0.0.1:3000/hello/world

