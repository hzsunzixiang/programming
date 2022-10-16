


% Makefile  
执行make
然后会生成一个ernie目录
进去之后 解压，然后执行start.sh，可以启动程序，如果不行，可以手工启动



ericksun@centos7-dev:~/programming/erlang/my_erlang/release/example-package-heart/ernie (master)$ bin/to_erl /tmp/
Attaching to /tmp/erlang.pipe.7 (^D to exit)

1> halt().
heart: Sun Oct 16 04:23:00 2022: Erlang has closed.
heart: Sun Oct 16 04:23:00 2022: Wait 5 seconds for Erlang to terminate nicely
heart: Sun Oct 16 04:23:00 2022: Executed "/home/ericksun/programming/erlang/my_erlang/release/example-package-heart/ernie/bin/bsc_heart" -> 0. Terminating.
[End]



此时发现无法杀掉进程，即使使用 kill -9
方法是删除重启文件 bsc_heart, 再执行 kill -9 , 就可以杀掉进程. 或者通过init模块

#  或者使用  init:stop() 来停止

ericksun@centos7-dev:~/programming/erlang/my_erlang/release/example-package-heart/ernie (master)$ bin/to_erl /tmp/
Attaching to /tmp/erlang.pipe.18 (^D to exit)

1> init:get_status().
{started,started}
2> init:stop().
ok



# heart 存在的情况下执行 init 模块
ericksun@centos7-dev:~/programming/erlang/my_erlang/release/example-package-heart/ernie (master)$ bin/to_erl /tmp/
Attaching to /tmp/erlang.pipe.17 (^D to exit)

1> init:restart().
ok
2> Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> self().
<0.191.0>
2> init:reboot().
ok
3> heart: Sun Oct 16 04:47:00 2022: Erlang has closed.
heart: Sun Oct 16 04:47:00 2022: Wait 5 seconds for Erlang to terminate nicely
heart: Sun Oct 16 04:47:00 2022: Executed "/home/ericksun/programming/erlang/my_erlang/release/example-package-heart/ernie/bin/bsc_heart" -> 0. Terminating.
[End]

