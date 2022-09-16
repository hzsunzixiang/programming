
github@9.134.165.238:~/program/programming/erlang/my_erlang/rebar3/test02 (master)$ rebar3 shell
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling test02
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Eshell V12.2  (abort with ^G)
1> ===> Booted test02

1> application:start(test02).
{error,{already_started,test02}}
2> application:which_applications().
[{test02,"An OTP application","0.1.0"},
 {inets,"INETS  CXC 138 49","7.5"},
 {ssl,"Erlang/OTP SSL application","10.6"},
 {public_key,"Public key infrastructure","1.11.3"},
 {asn1,"The Erlang ASN1 compiler version 5.0.17","5.0.17"},
 {crypto,"CRYPTO","5.0.5"},
 {stdlib,"ERTS  CXC 138 10","3.17"},
 {kernel,"ERTS  CXC 138 10","8.2"}]
3> test02_server:hello("hi dave").
1. hi dave
ok
4> test02_server:hello("hi again dave").
2. hi again dave
ok
5> test02_server:get_count().
{ok,2}
6>

