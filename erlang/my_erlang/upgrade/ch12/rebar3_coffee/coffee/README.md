coffee
=====

An OTP application

Build
-----

    $ rebar3 compile

1. rebar.config 中必须添加
        {dev_mode, false},

2. appup 文件中不能添加 这个， 否则报错[point_of_no_return]
true}])===> Error generating relup:
          No release upgrade script entry for coffee-0.2.0 to coffee-0.1.0 in file /home/ericksun/programming/erlang/my_erlang/upgrade/ch12/rebar3_coffee/coffee/_build/default/rel/coffee/lib/coffee-0.2.0/ebin/coffee.appup

