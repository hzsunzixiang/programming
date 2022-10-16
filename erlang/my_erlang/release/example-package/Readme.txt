


% Makefile  
执行make
然后会生成一个ernie目录
进去之后 解压，然后执行start.sh，可以启动程序，如果不行，可以手工启动



# init 模块的使用方式
ericksun@centos7-dev:~/programming/erlang/my_erlang/release/example-package/ernie (master)$ bin/to_erl /tmp/
Attaching to /tmp/erlang.pipe.17 (^D to exit)

1> self().
<0.98.0>
2> init:restart().
ok
3> Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> self().
<0.194.0>
2> frequency:allocate().
{ok,10}

# 没有heart的情况下， VM没有被重新启动
ericksun@centos7-dev:~/programming/erlang/my_erlang/release/example-package/ernie (master)$ bin/to_erl /tmp/
Attaching to /tmp/erlang.pipe.17 (^D to exit)

1> self().
<0.98.0>
2> init:reboot().
ok
3> [End]

# stop  , 有heart的情况下会先停止
ericksun@centos7-dev:~/programming/erlang/my_erlang/release/example-package/ernie (master)$ bin/to_erl  /tmp/
Attaching to /tmp/erlang.pipe.17 (^D to exit)

1> init:stop().
ok
2> [End]



# get_status 
ericksun@centos7-dev:~/programming/erlang/my_erlang/release/example-package/ernie (master)$ bin/to_erl  /tmp/
Attaching to /tmp/erlang.pipe.17 (^D to exit)

1> init:get_status().
{started,started}
2>

