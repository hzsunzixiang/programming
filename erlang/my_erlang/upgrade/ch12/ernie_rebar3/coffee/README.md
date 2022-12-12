coffee
=====

Coffee Machine Controller

Build
-----

    $ rebar3 compile
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

