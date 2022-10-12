frequency_rebar3
=====

frequency rebar3

Build
-----

    $ rebar3 compile

apps/frequency_rebar3/src/frequency_rebar3_sup.erl:16:1: Warning: function stop/0 is unused

apps/frequency_rebar3/src/my_logger.erl:2:2: Warning: undefined callback function handle_call/2 (behaviour 'gen_event')

Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> ===> Booted frequency_rebar3
===> Booted sasl

1>
1> observer:start().
ok
2> supervisor:which_children(frequency_rebar3_sup).
[{frequency,<0.199.0>,worker,[frequency]},
 {freq_overload,<0.198.0>,worker,[freq_overload]}]
3> supervisor:count_children(frequency_rebar3_sup).
[{specs,2},{active,2},{supervisors,0},{workers,2}]
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
Id:1 Time:{5,25,39} Date:{2022,10,12}
Event:{set_alarm,{no_frequency,<0.199.0>}}
{ok,15}
10> frequency:allocate().
Id:2 Time:{5,25,39} Date:{2022,10,12}
Event:{event,{frequency_denied,<0.199.0>}}
{error,no_frequency}
11> frequency:allocate().
Id:3 Time:{5,25,40} Date:{2022,10,12}
Event:{event,{frequency_denied,<0.199.0>}}
{error,no_frequency}

