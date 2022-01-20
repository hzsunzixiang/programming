

试了好几次才可以的, 多试几次

可能是域名访问不通，此时就要ping一下git等看下
看看是否开了其他的vpn
ericksun@centos-1:~/programming/erlang/my_erlang/rebar3/myapp (master)$ rebar3 compile
===> Verifying dependencies...
===> Failed to update package elli from repo hexpm
===> Package not found in any repo: elli ~> 3.3.0


ericksun@centos-1:~/programming/erlang/my_erlang/rebar3/myapp (master)$ rebar3 compile
===> Verifying dependencies...
===> Fetching elli v3.3.0
===> Analyzing applications...
===> Compiling elli
===> Analyzing applications...
===> Compiling myapp


#####   rebar3 hex 是一个插件

把  {plugins, [rebar3_hex]}. 写入文件 ~/.config/rebar3/rebar.config

https://hex.pm/docs/rebar3_publish
Erlang packages can be published through the rebar3 Hex plugin. It is suggested to place the entry in the global rebar3 config which should be made as ~/.config/rebar3/rebar.config.

 Example rebar.config file
{plugins, [rebar3_hex]}.
Publishing a package to Hex consists of registering a Hex user, adding metadata to the project’s .app.src file, and finally submitting the package with a rebar3 provider.


ericksun@centos-1:~/programming/erlang/my_erlang/rebar3/myapp (master)$ mkdir ~/.config/rebar3
ericksun@centos-1:~/programming/erlang/my_erlang/rebar3/myapp (master)$ vim ~/.config/rebar3/rebar.config
ericksun@centos-1:~/programming/erlang/my_erlang/rebar3/myapp (master)$ rebar3 hex user register

# 启动之后的进程是这样的 
rebar3 shell
ericksun   19029  4.6  1.3 2528436 52268 pts/6   Sl+  07:59   0:00 /usr/bin/rebar3 -B -sbtu -A1 -- -root /usr/lib64/erlang -progname erl -- -home /home/ericks

