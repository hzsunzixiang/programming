

ericksun@centos7-dev:~/programming/erlang/my_erlang/application/ch9 (master)$ erl -pa bsc-2.0/ebin
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> application:which_applications().
[{stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
2> application
application               application_controller    application_master
application_starter
2> application:ensure_all_started(bsc).
{ok,[sasl,bsc]}
3> application:ensure_all_started(bsc).
{ok,[]}
4> application:which_applications().
[{bsc,"Base Station Controller","2.0"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
5>




15> simple_phone_sup:attach_phone(1).
{ok,<0.134.0>}
16> simple_phone_sup:attach_phone(2).
{ok,<0.137.0>}

phone:start_test(150,500).
5> my_counters:get_counters(freq_overload).
{counters,[{{event,{frequency_denied,<0.98.0>}},12},
           {{clear_alarm,no_frequency},6},
           {{set_alarm,{no_frequency,<0.98.0>}},6}]}

