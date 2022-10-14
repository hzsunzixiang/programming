
application 和 supervisor 合并在一起

ericksun@centos7-dev:~/programming/erlang/my_erlang/application/ch9 (master)$ erl -pa bsc-1.0/ebin
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> application:start(bsc).
{error,{not_started,sasl}}
2> application:start(sasl).
ok
3> application:start(bsc).
ok
4> observer:start().
ok
6> frequency:allocate().
{ok,10}
7> frequency:allocate().
{ok,11}
9> frequency:allocate().
{ok,12}
10> frequency:allocate().
{ok,13}
11> frequency:allocate().
{ok,14}
12> frequency:allocate().
{ok,15}
13> Id:1 Time:{5,34,47} Date:{2022,10,13}
Event:{set_alarm,{no_frequency,<0.99.0>}}
13> frequency:allocate().
Id:2 Time:{5,34,48} Date:{2022,10,13}
Event:{event,{frequency_denied,<0.99.0>}}
{error,no_frequency}
14> frequency:deallocate(10).
Id:3 Time:{5,34,53} Date:{2022,10,13}
Event:{clear_alarm,no_frequency}
ok
15> simple_phone_sup:attach_phone(1).
{ok,<0.134.0>}
16> simple_phone_sup:attach_phone(2).
{ok,<0.137.0>}

phone:start_test(150,500).
5> my_counters:get_counters(freq_overload).
{counters,[{{event,{frequency_denied,<0.98.0>}},12},
           {{clear_alarm,no_frequency},6},
           {{set_alarm,{no_frequency,<0.98.0>}},6}]}

