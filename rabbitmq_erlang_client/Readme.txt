

# RabbitMQ的启动版本如下
3.5.6 版本的MQ启动的erts按本为5.10.4 
erlang 版本为
root@9.134.165.238:/data/github/program/programming/rabbitmq_erlang_client (master)# erl
Erlang R16B03-1 (erts-5.10.4) [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false]
Eshell V5.10.4  (abort with ^G)


root      6684  0.8  0.2 4342872 43372 pts/17  Sl   03:23  10:00 /usr/lib64/erlang/erts-5.10.4/bin/beam.smp -W w -A 64 -P 1048576 -K true -B i -- -root /usr/lib64/erlang -progname erl -- -home /root -- -pa ./../ebin -noshell -noinput -s rabbit boot -sname rabbit@VM-165-238-centos -boot start_sasl -kernel inet_default_connect_options [{nodelay,true}] -sasl errlog_type error -sasl sasl_error_logger false -rabbit error_logger {file,"./../var/log/rabbitmq/rabbit@VM-165-238-centos.log"} -rabbit sasl_error_logger {file,"./../var/log/rabbitmq/rabbit@VM-165-238-centos-sasl.log"} -rabbit enabled_plugins_file "./../etc/rabbitmq/enabled_plugins" -rabbit plugins_dir "./../plugins" -rabbit plugins_expand_dir "./../var/lib/rabbitmq/mnesia/rabbit@VM-165-238-centos-plugins-expand" -os_mon start_cpu_sup false -os_mon start_disksup false -os_mon start_memsup false -mnesia dir "./../var/lib/rabbitmq/mnesia/rabbit@VM-165-238-centos" -kernel inet_dist_listen_min 25672 -kernel inet_dist_listen_max 25672

Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]


# 运行client的erlang版本 如下
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Eshell V12.2  (abort with ^G)


# API

https://github.com/rabbitmq/rabbitmq-erlang-client/blob/master/src/amqp_connection.erl
