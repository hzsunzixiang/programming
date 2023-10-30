erl -sname mynode3 -pa ./simple_cache/ebin -pa ./resource_discovery/ebin
application:start(sasl).
mnesia:start().
application:start(resource_discovery).
application:start(simple_cache).
simple_cache:lookup(123).


# for i in $(find deps  -name ebin); do echo -pa $i; done |tr '\n'  ' '

# erl -sname mynode3  -paeps/gen_web_server/ebin -pa deps/http_interface/ebin -pa deps/recon/ebin -pa deps/resource_discovery/ebin -pa deps/simple_cache/ebin


(mynode3@centos7-mq1)1> application:start(sasl).
ok
(mynode3@centos7-mq1)2> mnesia:start().
ok
(mynode3@centos7-mq1)3> application:start(resource_discovery).
ok
(mynode3@centos7-mq1)4> application:start(simple_cache).
=INFO REPORT==== 29-Oct-2023::23:50:45.718950 ===
    application: mnesia
    exited: stopped
    type: temporary

ok
(mynode3@centos7-mq1)5> simple_cache:lookup(123).
=INFO REPORT==== 29-Oct-2023::23:51:08.839515 ===
lookup(123)

{ok,abc}

(mynode3@centos7-mq1)7> application:ensure_all_started(http_interface).
{ok,[gen_web_server,http_interface]}

ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11 (master)$ echo Erlang > put.txt
ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11 (master)$ curl -T put.txt http://localhost:1156/xyzzy
ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11 (master)$ curl http://localhost:1156/xyzzy
Erlang

