gen_server_release
=====

An OTP application

Build
-----

    $ rebar3 compile



rebar3 release 运行一个软件




● 用监督树启动
init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    %ChildSpecs = [],
    ChildSpecs = [child(frequency)],
    {ok, {SupFlags, ChildSpecs}}.

ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/rebar3/gen_server_release (master)$
ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/rebar3/gen_server_release (master)$ rebar3 shell
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling gen_server_release
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> ===> Booted recon
===> Booted gen_server_release
===> Booted sasl

1> gen_server:call(frequency, {allocate, self()}).
{ok,10}
2> gen_server:call(frequency, {allocate, self()}).
{ok,11}


也可以不放入其中，手工启动

init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    ChildSpecs = [],
    %ChildSpecs = [child(frequency)],
    {ok, {SupFlags, ChildSpecs}}.


ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/rebar3/gen_server_release (master)$ rebar3 shell
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling gen_server_release
apps/gen_server_release/src/gen_server_release_sup.erl:33:1: Warning: function child/1 is unused

Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> ===> Booted recon
===> Booted gen_server_release
===> Booted sasl

1> gen_server:call(frequency, {allocate, self()}).
** exception exit: {noproc,{gen_server,call,[frequency,{allocate,<0.155.0>}]}}
     in function  gen_server:call/2 (gen_server.erl, line 367)
2> frequency:st
start/0       start_link/0  stop/0
2> frequency:start_link().
{ok,<0.178.0>}
3> gen_server:call(frequency, {allocate, self()}).
{ok,10}
4> gen_server:call(frequency, {allocate, self()}).
{ok,11}




