wget https://erlang.mk/erlang.mk
mkdir ~/.bash_completion.d/
cd ~/.bash_completion.d/
wget -O erlang_mk https://raw.githubusercontent.com/ninenines/erlang.mk/master/etc/bash_completion
source ~/.bash_completion
make -f erlang.mk bootstrap


● Makefile 中 去掉BUILD_DEPS += relx 
● make run 会报错


● makea 一下 
ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_joe (master)$ ls ebin/
hello_joe.app  hello_joe_app.beam  hello_joe_sup.beam

●用如下命令运行
ericksun@centos7-mq1:~/programming/erlang/my_erlang/erlang.mk/hello_joe (master)$ erl -pa ebin/
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> application:ensure_all_started(hello_joe).
{ok,[hello_joe]}
2> application:which_applications().
[{hello_joe,"New project","0.1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]

