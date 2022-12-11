ericksun@centos7-dev:~/programming/erlang/my_erlang/upgrade/ch12 (master)$ erl -pa coffee-1.0/ebin/
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> application:start(sasl).
ok
2> application:start(coffee).
Machine:Rebooted Hardware
Display:Make Your Selection
ok
3> coffee_fsm:module_info(attributes).
[{behaviour,[gen_fsm]},{vsn,['1.0']}]
4>

