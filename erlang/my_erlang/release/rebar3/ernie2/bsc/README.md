bsc
=====

Base Station Controller

Build
-----

    $ rebar3 compile

3> regs().

** Registered procs on node nonode@nohost **
Name                  Pid          Initial Call                      Reds Msgs
alarm_handler         <0.213.0>    gen_event:init_it/6                 70    0
logger                <0.42.0>     logger_server:init/1              1583    0
bsc_sup               <0.203.0>    supervisor:bsc_sup/1               532    0
freq_overload         <0.204.0>    gen_event:init_it/6                243    0
frequency             <0.206.0>    frequency:init/1                   185    0
simple_phone_sup      <0.207.0>    supervisor:simple_phone_s          210    0



1> frequency:allocate().
{ok,10}
2> frequency:allocate().
{ok,11}
3> frequency:allocate().
{ok,12}
4> frequency:allocate().
{ok,13}
5> my_counters:get_counters(freq_overload).
{counters,[]}
6> frequency:allocate().
{ok,14}
7> frequency:allocate().
{ok,15}
Id:1 Time:{5,20,20} Date:{2022,10,11}
Event:{set_alarm,{no_frequency,<0.222.0>}}
8> frequency:allocate().
{error,no_frequency}
Id:2 Time:{5,20,20} Date:{2022,10,11}
Event:{event,{frequency_denied,<0.222.0>}}
9> frequency:allocate().
{error,no_frequency}
Id:3 Time:{5,20,21} Date:{2022,10,11}
Event:{event,{frequency_denied,<0.222.0>}}
10> frequency:allocate().
{error,no_frequency}
Id:4 Time:{5,20,21} Date:{2022,10,11}
Event:{event,{frequency_denied,<0.222.0>}}
11> frequency:allocate().
{error,no_frequency}
Id:5 Time:{5,20,22} Date:{2022,10,11}
Event:{event,{frequency_denied,<0.222.0>}}
12> frequency:allocate().
{error,no_frequency}
Id:6 Time:{5,20,22} Date:{2022,10,11}
Event:{event,{frequency_denied,<0.222.0>}}
13> frequency:allocate().
{error,no_frequency}
Id:7 Time:{5,20,23} Date:{2022,10,11}
Event:{event,{frequency_denied,<0.222.0>}}
14> my_counters:get_counters(freq_overload).
{counters,[{{set_alarm,{no_frequency,<0.222.0>}},1},
           {{event,{frequency_denied,<0.222.0>}},6}]}



可以看到 动态子进程 
19> simple_phone_sup:attach_phone(1).
{ok,<0.283.0>}
20> simple_phone_sup:attach_phone(2).
{ok,<0.286.0>}
21>
21> simple_phone_sup:attach_phone(3).
{ok,<0.289.0>}
22> supervisor:which_children(simple_phone_sup).
[{undefined,<0.283.0>,worker,[phone_fsm]},
 {undefined,<0.286.0>,worker,[phone_fsm]},
  {undefined,<0.289.0>,worker,[phone_fsm]}]
  23>




注意这里的测试, 没有加入到监督树中，是独立的， 只有通过  simple_phone_sup:attach_phone(1) 这种方式才是加入监督熟的
phone:start_test(150,500) 
