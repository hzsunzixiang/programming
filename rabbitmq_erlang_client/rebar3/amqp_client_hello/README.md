amqp_client_hello
=====

An OTP application

Build
-----

    $ rebar3 compile


ericksun@centos7-mq:~/programming/rabbitmq_erlang_client/rebar3/amqp_client_hello (master)$ rebar3 shell --sname test
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling amqp_client_hello
src/amqp_direct.erl:71:43: Warning: variable 'Content' is unused

Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
(test@centos7-mq)1> ===> Booted xmerl
===> Booted compiler
===> Booted sasl
===> Booted syntax_tools
===> Booted tools
===> Booted thoas
===> Booted recon
===> Booted credentials_obfuscation
===> Booted rabbit_common
===> Booted amqp_client
===> Booted amqp_client_hello

(test@centos7-mq)1> amqp_direct:start().
amqp_connection:start begin
=WARNING REPORT==== 21-Jan-2023::00:37:40.121828 ===
AMQP 0-9-1 client call timeout was 70000 ms, is updated to a safe effective value of 130000 ms
amqp_connection:start result: {ok,<0.310.0>}
"Finish"
(test@centos7-mq)2>

