



# start_phase

ericksun@centos7-dev:~/programming/erlang/my_erlang/application/ch9 (master)$ erl -pz bsc-start-phases-1.0/ebin/  -sasl sasl_error_logger false
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> application:ensure_all_started(bsc).
bsc:start_phase(init,normal,[]).
bsc:start_phase(admin,normal,[]).
bsc:start_phase(oper,normal,[]).
{ok,[sasl,bsc]}

