


网络非常不稳定,需要多试几次


* 有问题
github@9.134.165.238:~/program/programming/erlang/my_erlang/rebar3/my_hex_pm (master)$ rebar3 update DEBUG=1
=NOTICE REPORT==== 13-Sep-2022::17:06:48.344338 ===
TLS client: In state hello at tls_record.erl:564 generated CLIENT ALERT: Fatal - Unexpected Message
 - {unsupported_record_type,72}
===> Failed to update package rebar3_hex from repo hexpm
===> Errors loading plugin rebar3_hex. Run rebar3 with DEBUG=1 set to see errors.
===> Failed to update package goldrush from repo hexpm
=NOTICE REPORT==== 13-Sep-2022::17:06:53.441998 ===
TLS client: In state hello at tls_record.erl:564 generated CLIENT ALERT: Fatal - Unexpected Message
 - {unsupported_record_type,72}
===> Failed to fetch updates for package goldrush from repo hexpm


* 正常了
github@9.134.165.238:~/program/programming/erlang/my_erlang/rebar3/my_hex_pm (master)$ rebar3 update
===> Fetching verl v1.1.1
===> Analyzing applications...
===> Compiling verl
===> Compiling hex_core
===> Compiling rebar3_hex

