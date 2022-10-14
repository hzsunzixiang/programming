erl -config bsc.config -sasl sasl_error_logger false -pa bsc-1.0/ebin



#ericksun@centos7-dev:~/programming/erlang/my_erlang/application/ch9 (master)$ bash my_run.sh
#Erlang/OTP 19 [erts-8.3.5.3] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]
#
#Eshell V8.3.5.3  (abort with ^G)
#1>
#1>
#1> application:start(sasl).
#ok
#2> application:get_all_env(sasl).
#[{errlog_type,error},
# {included_applications,[]},
# {sasl_error_logger,false}]
#3> application:start(bsc).
#ok
#4> application:get_env(bsc, frequencies).
#{ok,[1,2,3,4,5,6]}
#5> application:set_env(bsc, frequencies, [2,3,4,5,6,7,8,9]).
#ok
#6> application:get_env(bsc, frequencies).
#{ok,[2,3,4,5,6,7,8,9]}
