从一个手工创建的工程构建rebar3 工程



=====================================================
application 和 supervisor 独立文件

ericksun@centos7-dev:~/programming/erlang/my_erlang/application/ch9/rebar3_bsc_from_scrash/bsc-1.0 (master)$ rebar3 shell                             [25/832]
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling bsc
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> ===> Booted syntax_tools
===> Booted compiler
===> Booted goldrush
===> Booted lager
===> Booted bsc
===> Booted sasl

1> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.2"},
 {bsc,"Base Station Controller","1.0"},
 {lager,"Erlang logging framework","3.9.2"},
 {goldrush,"Erlang event stream processor","0.1.9"},
 {compiler,"ERTS  CXC 138 10","8.2"},
 {syntax_tools,"Syntax tools","3.0"},
 {inets,"INETS  CXC 138 49","8.0"},
 {ssl,"Erlang/OTP SSL application","10.8.3"},
 {public_key,"Public key infrastructure","1.13"},
 {asn1,"The Erlang ASN1 compiler version 5.0.19","5.0.19"},
 {crypto,"CRYPTO","5.1.1"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
2> frequency:allocate().
{ok,1}
3> frequency:allocate().
{ok,2}
4> frequency:allocate().
{ok,3}
5> frequency:allocate().
{ok,4}
6> frequency:allocate().
{ok,5}
7> frequency:allocate().
{ok,6}
Id:1 Time:{5,31,35} Date:{2022,10,21}
Event:{set_alarm,{no_frequency,<0.204.0>}}
8> frequency:allocate().
{error,no_frequency}
9> Id:2 Time:{5,31,36} Date:{2022,10,21}
Event:{event,{frequency_denied,<0.204.0>}}
9> frequency:allocate().
Id:3 Time:{5,31,36} Date:{2022,10,21}
Event:{event,{frequency_denied,<0.204.0>}}
{error,no_frequency}
10> frequency:allocate().
Id:4 Time:{5,31,37} Date:{2022,10,21}
Event:{event,{frequency_denied,<0.204.0>}}
{error,no_frequency}
11> frequency:deallocate(11).
Id:5 Time:{5,31,41} Date:{2022,10,21}
Event:{clear_alarm,no_frequency}
ok

