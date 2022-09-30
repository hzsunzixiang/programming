

# 直接使用 global模块, 可以看到会在节点间同步
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
RUN_BINr@centos7-dev)1> net_kernel:connect_node('apple@centos7-dev').
true
(pear@centos7-dev)2> global:whereis_name(testapple).
<10425.87.0>
(pear@centos7-dev)3> global:register_name(testpear, self()).
yes
(pear@centos7-dev)4> global:registered_names().
[testapple,testpear]


====================================================================

ericksun@centos7-dev:~/programming/erlang/my_erlang/global (master)$ erl -sname apple -setcookie test
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
(apple@centos7-dev)1> global:register_name(testapple, self()).
yes
(apple@centos7-dev)2> global:whereis_name(testapple).
<0.87.0>
(apple@centos7-dev)3> global:whereis_name(testpear).
<9371.87.0>
(apple@centos7-dev)4> global:register
register_name/2           register_name/3           register_name_external/2
register_name_external/3  registered_names/0
(apple@centos7-dev)4> global:registered_names().
[testapple,testpear]

