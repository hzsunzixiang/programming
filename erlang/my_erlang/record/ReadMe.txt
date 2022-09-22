
ericksun@centos7-dev:~/programming/erlang/my_erlang/record (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> c(records_1).
{ok,records_1}
2> records_1:first_robot().
{robot,"Mechatron",handmade,undefined,
       ["Moved by a small man inside"]}
3>  rr(records_1).
[robot]
4>  records_1:first_robot().
#robot{name = "Mechatron",type = handmade,
       hobbies = undefined,
       details = ["Moved by a small man inside"]}
5>

