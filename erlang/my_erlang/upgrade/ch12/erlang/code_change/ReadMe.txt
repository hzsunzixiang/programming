
还不是太清晰
%%%%%%%%%%%%%%%%%%这样就可以触发升级了
Eshell V13.0.4  (abort with ^G)
1> coffee:start_link().
Machine:Rebooted Hardware
Display:Make Your Selection
{ok,<0.83.0>}
2> coffee:module_info(attributes).
[{vsn,[1.0]}]
3> coffee ! {upgrade, {}}.
in code_change State:.....
{upgrade,{}}
4>

%%%%%%%%%%%%
Eshell V13.0.4  (abort with ^G)
1> coffee:start_link().
Machine:Rebooted Hardware
Display:Make Your Selection
{ok,<0.83.0>}
2> coffee:module_info(attributes).
[{vsn,[60136084640283161717203717741574148931]}]
4> coffee ! {upgrade, {}}.
{upgrade,{}}
5> coffee:module_info(attributes).
[{vsn,[60136084640283161717203717741574148931]}]
6> coffee ! {upgrade, {}}.
{upgrade,{}}
9> coffee:module_info(attributes).
[{vsn,[60136084640283161717203717741574148931]}]
10> l(coffee).     %%% 在这里替换并加载新的模块
{module,coffee}
11> coffee:module_info(attributes).
[{vsn,[1.0]}]
12> coffee ! {upgrade, {}}.
{upgrade,{}}
13>

%%%%%%%%%%%%%
ericksun@centos7-dev:~/programming/erlang/my_erlang/upgrade/ch12/erlang/code_change (master)$ erl -pb patches
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
	1> coffee:start_link().
	Machine:Rebooted Hardware
	Display:Make Your Selection in old version
{ok,<0.83.0>}
2> coffee:module_info(attributes).
[{vsn,[114494025025147511558384216146965353509]}]
3> coffee ! {upgrade, {}}.
{upgrade,{}}
4> coffee:module_info(attributes).
[{vsn,[114494025025147511558384216146965353509]}]
5> l(coffee).
{module,coffee}
6> coffee:module_info(attributes).
[{vsn,[114494025025147511558384216146965353509]}]
7>

