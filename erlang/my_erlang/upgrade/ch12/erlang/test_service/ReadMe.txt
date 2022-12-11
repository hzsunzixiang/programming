ericksun@centos7-dev:~/programming/erlang/my_erlang/upgrade/ch12/erlang/test_service (master)$ erl -pa patches
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> coffee:start_link().
Machine:Rebooted Hardware
Display:Make Your Selection
{ok,<0.83.0>}
2> coffee:module_info(attributes).
[{vsn,[1.0]}]
3> coffee ! {upgrade, {}}.
{upgrade,{}}
4> coffee:module_info(attributes).
[{vsn,[1.0]}]
5> l(coffee).
{module,coffee}
6> coffee:module_info(attributes).
[{vsn,[1.1]}]
7> coffee:espresso().
Display:Please pay:150
{selection,espresso,150}
8> coffee:pay(100).
Display:Please pay:50
{pay,100}
9> coffee ! {upgrade, {}}.
Machine:Returned 100 in change
{upgrade,{}}
Display:Make Your Selection
10> coffee:open().
Display:Open
open
11> coffee:espresso().
{selection,espresso,150}
12> coffee:close().
Machine:Rebooted Hardware
close
Display:Make Your Selection

