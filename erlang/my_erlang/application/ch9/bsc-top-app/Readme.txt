ericksun@centos7-dev:~/programming/erlang/my_erlang/application/ch9 (master)$ erl -pa bsc-top-app/ebin/
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> application:ensure_all_started(top_app).
top_app:start_phase(start,normal,[]).
top_app:start_phase(admin,normal,[]).
bsc:start_phase(admin,normal,[]).
top_app:start_phase(stop,normal,[]).
{ok,[sasl,top_app]}
2> observer:start().
ok

