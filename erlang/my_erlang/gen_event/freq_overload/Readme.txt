
ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_event/freq_overload (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> {ok, PF} = frequency:start_link().
{ok,<0.83.0>}
2> {ok, PO} = freq_overload:start_link().
init file:{<0.86.0>}
{ok,<0.85.0>}
3> counters_my:get_counters_my(PO).
{counters_my,[]}
4> frequency:allocate().
{ok,10}
5> frequency:allocate().
{ok,11}
6> frequency:allocate().
{ok,12}
7> frequency:allocate().
{ok,13}
8> frequency:allocate().
{ok,14}
9> frequency:allocate().
Id:1 Time:{4,0,0} Date:{2022,10,17}
Event:{set_alarm,{no_frequency,<0.83.0>}}
{ok,15}
10> frequency:allocate().
{error,no_frequency}
Id:2 Time:{4,0,1} Date:{2022,10,17}
Event:{event,{frequency_denied,<0.83.0>}}
11> frequency:allocate().
{error,no_frequency}
Id:3 Time:{4,0,2} Date:{2022,10,17}
Event:{event,{frequency_denied,<0.83.0>}}
12> counters_my:get_counters_my(PO).
{counters_my,[{{event,{frequency_denied,<0.83.0>}},2},
              {{set_alarm,{no_frequency,<0.83.0>}},1}]}
13> frequency:deallocate(10).
Id:4 Time:{4,0,19} Date:{2022,10,17}
Event:{clear_alarm,no_frequency}
ok
14> counters_my:get_counters_my(PO).
{counters_my,[{{clear_alarm,no_frequency},1},
              {{event,{frequency_denied,<0.83.0>}},2},
              {{set_alarm,{no_frequency,<0.83.0>}},1}]}

