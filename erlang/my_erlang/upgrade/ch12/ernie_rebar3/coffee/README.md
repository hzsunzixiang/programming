coffee
=====

Coffee Machine Controller

Build
-----

    $ rebar3 compile

%%%% 2022.12.15 更新 ，成功了


% 旧版本
git checkout 1.0
rebar3 compile && rebar3 release
% 新版本 
git checkout 1.1
python3 upgrade.py


%%%%%%% 
太麻烦了，需要手工操作，思路可能不对。

perl -i -pe 's/0\.1\.0/1.0/' ./apps/coffee/src/coffee.app.src ./rebar.config
cp ../../coffee-1.0/src/*.erl apps/coffee/src/



ericksun@centos7-dev:~/programming/erlang/my_erlang/upgrade/ch12/ernie_rebar3/coffee (master)$ rebar3 as prod relup
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling coffee
===> Assembling release coffee-1.1...
===> Release successfully assembled: _build/prod/rel/coffee
===> Option --relname is missing

这里老报错无法生成,所以直接拷贝


cp ../../ernie_upgrade/relup _build/prod/rel/coffee/


然后一步步执行:

Eshell V13.0.4  (abort with ^G)
(coffee@centos7-dev)1> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.2"},
 {coffee,"Coffee Machine Controller","1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(coffee@centos7-dev)2> release_handler:unpack_release("coffee-1.1").
{error,{no_such_file,"/home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie_rebar3/coffee/_build/prod/rel/coffee/releases/coffee-1.1.tar.gz"}}
(coffee@centos7-dev)3> release_handler:unpack_release("coffee-1.1").
{error,{enoent,"/home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie_rebar3/coffee/_build/prod/rel/coffee/releases/coffee-1.1.rel"}}
(coffee@centos7-dev)4> release_handler:unpack_release("coffee-1.1").
{error,{enoent,"/home/ericksun/programming/erlang/my_erlang/upgrade/ch12/ernie_rebar3/coffee/_build/prod/rel/coffee/releases/coffee-1.1.rel"}}
(coffee@centos7-dev)5> release_handler:unpack_release("coffee-1.1").
{ok,"1.1"}
(coffee@centos7-dev)6> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.2"},
 {coffee,"Coffee Machine Controller","1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]





