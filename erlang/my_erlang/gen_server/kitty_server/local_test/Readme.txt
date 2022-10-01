
在节点 apple@centos7-dev 上启动服务
ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/ch4 (master)$ erl -sname apple -setcookie test
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
(apple@centos7-dev)1> {ok,Pid} = frequency:start_link().
{ok,<0.89.0>}
(apple@centos7-dev)2>


● 在节点 pear@centos7-dev 上链接apple
net_kernel:connect_node('apple@centos7-dev').
● 发送请求
gen_server:multi_call(frequency, {allocate, self()}).
● pear上也启动一个
{ok,Pid} = frequency:start_link().
● 会广播发送
https://www.erlang.org/doc/man/gen_server.html#multi_call-2
Nodes is a list of node names to which the request is to be sent. Default value is the list of all known nodes [node()|nodes()].
ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/ch4 (master)$ erl -sname pear -setcookie test
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
(pear@centos7-dev)1> net_kernel:connect_node('apple@centos7-dev').
true
(pear@centos7-dev)2> nodes().
['apple@centos7-dev']
(pear@centos7-dev)3> node().
'pear@centos7-dev'
(pear@centos7-dev)4> gen_server:multi_call(frequency, {allocate, self()}).
{[{'apple@centos7-dev',{ok,10}}],['pear@centos7-dev']}
(pear@centos7-dev)5> gen_server:multi_call(frequency, {allocate, self()}).
{[{'apple@centos7-dev',{ok,11}}],['pear@centos7-dev']}
(pear@centos7-dev)6> gen_server:multi_call(frequency, {allocate, self()}).
{[{'apple@centos7-dev',{ok,12}}],['pear@centos7-dev']}
(pear@centos7-dev)7>
(pear@centos7-dev)7> {ok,Pid} = frequency:start_link().
{ok,<0.100.0>}
(pear@centos7-dev)8> gen_server:multi_call(frequency, {allocate, self()}).
{[{'pear@centos7-dev',{ok,10}},
  {'apple@centos7-dev',{ok,13}}],
 []}
(pear@centos7-dev)9> gen_server:multi_call(frequency, {allocate, self()}).
{[{'pear@centos7-dev',{ok,11}},
  {'apple@centos7-dev',{ok,14}}],
 []}
(pear@centos7-dev)10> gen_server:multi_call(frequency, {allocate, self()}).
{[{'pear@centos7-dev',{ok,12}},
  {'apple@centos7-dev',{ok,15}}],
 []}
(pear@centos7-dev)11> gen_server:multi_call(frequency, {allocate, self()}).
{[{'pear@centos7-dev',{ok,13}},
  {'apple@centos7-dev',{error,no_frequency}}],
 []}




(pear@centos7-dev)24> gen_server:abcast(frequency, {deallocate, 14}).
abcast
(pear@centos7-dev)25> gen_server:abcast(frequency, {deallocate, 15}).
abcast
(pear@centos7-dev)26> gen_server:multi_call(frequency, {allocate, self()}).
{[{'apple@centos7-dev',{ok,15}}],['pear@centos7-dev']}
(pear@centos7-dev)27> gen_server:multi_call(frequency, {allocate, self()}).
{[{'apple@centos7-dev',{ok,14}}],['pear@centos7-dev']}

