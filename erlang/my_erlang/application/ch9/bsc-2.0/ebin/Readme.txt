

如果没有bsc.app 文件: 报错如下
ericksun@centos7-dev:~/programming/erlang/my_erlang/application/ch9 (master)$ erl -config bsc.config -sasl sasl_error_logger false -pa bsc-1.0/ebin
Erlang/OTP 19 [erts-8.3.5.3] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]

Eshell V8.3.5.3  (abort with ^G)
1> application:start(sasl).
ok
2> application:get_all_env(sasl).
[{errlog_type,error},
 {included_applications,[]},
 {sasl_error_logger,false}]
3> application:start(bsc).
{error,{"no such file or directory","bsc.app"}}
4>
