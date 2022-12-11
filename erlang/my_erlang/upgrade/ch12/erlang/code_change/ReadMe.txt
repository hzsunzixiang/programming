

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

