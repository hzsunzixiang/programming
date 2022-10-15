


# 这里演示直接手工启动，不打包

* 第一步执行 make
* 然后 用这个命令运行
erl -pa bsc/ebin -boot basestation


ericksun@centos7-dev:~/programming/erlang/my_erlang/release/example-no-package (master)$ erl -pa bsc/ebin -boot basestation
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> application:which_applications().
[{bsc,"Base Station Controller","1.0"},
 {sasl,"SASL  CXC 138 11","4.2"},
  {stdlib,"ERTS  CXC 138 10","4.0.1"},
   {kernel,"ERTS  CXC 138 10","8.4.2"}]
   2> observer:st
   start/0  stop/0
   2> observer:start().
   ok
   3> frequency:allocate().
   {ok,10}
   4> frequency:allocate().
   {ok,11}
   5> frequency:allocate().
   {ok,12}
   6> frequency:allocate().
   {ok,13}
   7> frequency:allocate().
   {ok,14}
   8> frequency:allocate().
   Id:1 Time:{8,10,18} Date:{2022,10,15}
   Event:{set_alarm,{no_frequency,<0.93.0>}}
   {ok,15}
   9>
   9> frequency:allocate().
   Id:2 Time:{8,10,20} Date:{2022,10,15}
   Event:{event,{frequency_denied,<0.93.0>}}
   {error,no_frequency}
   10> frequency:deallocate(10).
   Id:3 Time:{8,10,25} Date:{2022,10,15}
   Event:{clear_alarm,no_frequency}
   ok


