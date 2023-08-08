
ericksun@centos7-mq1:~/programming/erlang/my_erlang/gen_event/alarm_handler/config_template (master)$ erl -boot start_sasl -kernel logger_sasl_compatible true -config elog2
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> observer:start().
ok
2> error_logger:error_report("Serious error in my module").
ok
3> =ERROR REPORT==== 7-Aug-2023::22:46:21.369572 ===
Serious error in my module

