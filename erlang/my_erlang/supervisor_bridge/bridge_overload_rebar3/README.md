bridge_overload_rebar3
=====

supervisor_bridge overload  rebar3

Build
-----

    $ rebar3 compile

Eshell V13.0.4  (abort with ^G)
1> ===> Booted bridge_overload_rebar3
===> Booted sasl
1> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.2"},
 {bridge_overload_rebar3,"supervisor_bridge overload  rebar3",
                         "0.1.0"},
 {inets,"INETS  CXC 138 49","8.0"},
 {ssl,"Erlang/OTP SSL application","10.8.3"},
 {public_key,"Public key infrastructure","1.13"},
 {asn1,"The Erlang ASN1 compiler version 5.0.19","5.0.19"},
 {crypto,"CRYPTO","5.1.1"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
2> supervisor:which_children(bridge_overload_rebar3_sup).
[{freq_overload,<0.214.0>,worker,[freq_overload]},
 {frequency_sup_bridge,<0.212.0>,worker,
                       [frequency_sup_bridge]}]
3> observer:start().
ok
4> frequency:allocate().
{ok,10}
5> frequency:allocate().
{ok,11}



ericksun@centos7-dev:~/programming/erlang/my_erlang/supervisor_bridge/bridge_overload_rebar3 (master)$ rebar3 shell
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling bridge_overload_rebar3
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> ===> Booted bridge_overload_rebar3
===> Booted sasl

1> frequency:allocate().
{ok,10}
2> frequency:allocate().
{ok,11}
3> frequency:allocate().
{ok,12}
4> frequency:allocate().
{ok,13}
5> frequency:allocate().
{ok,14}
6> frequency:allocate().
Id:1 Time:{4,34,0} Date:{2022,10,13}
Event:{set_alarm,{no_frequency,<0.146.0>}}
{ok,15}
7> frequency:allocate().
Id:2 Time:{4,34,1} Date:{2022,10,13}
Event:{event,{frequency_denied,<0.146.0>}}
{error,no_frequency}
8> frequency:deallocate(10).
Id:3 Time:{4,34,7} Date:{2022,10,13}
Event:{clear_alarm,no_frequency}
ok

