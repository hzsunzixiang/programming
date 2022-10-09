kitty_server_proc_lib_rebar3
=====

An OTP application

Build
-----

    $ rebar3 compile



ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/myself/kitty_server_proc_lib_rebar3 (master)$ rebar3 shell
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling kitty_server_proc_lib_rebar3
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> mutex kitty_server2: init
===> Booted kitty_server_proc_lib_rebar3
===> Booted sasl

1> Cat1 = kitty_server2:order_cat(kitty_server2, carl_1, brown, "loves to burn bridges").
sync in loop LoopStatus: []
mutex kitty_server2: {reply,{cat,carl_1,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]},[]}
{cat,carl_1,brown,"loves to burn bridges"}
2> sys:log(kitty_server2, true).
ok
3> sys:statistics(kitty_server2,true).
ok
4> sys:log(kitty_server2, get).
{ok,[]}
5>  Cat2 = kitty_server2:order_cat(kitty_server2, carl_2, brown, "loves to burn bridges").
sync in loop LoopStatus: []
mutex kitty_server2: {reply,{cat,carl_2,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]},[]}
{cat,carl_2,brown,"loves to burn bridges"}
6> sys:log(kitty_server2, get).
{ok,[{reply,{cat,carl_2,brown,"loves to burn bridges"},[]}]}
7> kitty_server2:return_cat(kitty_server2, Cat1),
7> kitty_server2:return_cat(kitty_server2, Cat1).
mutex kitty_server2: {async,{return,{cat,carl_1,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]}}}
async in loop LoopStatus: [{cat,carl_1,brown,"loves to burn bridges"}]
ok
mutex kitty_server2: {async,{return,{cat,carl_1,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]}}}
8> async in loop LoopStatus: [{cat,carl_1,brown,"loves to burn bridges"},
                           {cat,carl_1,brown,"loves to burn bridges"}]

8> sys:log(kitty_server2, get).
{ok,[{reply,{cat,carl_2,brown,"loves to burn bridges"},[]},
     {async,{return,{cat,carl_1,brown,"loves to burn bridges"}}},
     {async,{return,{cat,carl_1,brown,
                         "loves to burn bridges"}}}]}

10> whereis(kitty_server_proc_lib_rebar3).
undefined
11> whereis(kitty_server_proc_lib_rebar3_sup).
<0.144.0>
12> whereis(kitty_server2).
<0.145.0>
13>

