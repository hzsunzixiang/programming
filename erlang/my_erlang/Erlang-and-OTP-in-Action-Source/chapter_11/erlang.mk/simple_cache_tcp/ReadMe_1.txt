

# for i in $(find deps  -name ebin); do echo -pa $i; done |tr '\n'  ' '

# erl -sname mynode3  -paeps/gen_web_server/ebin -pa deps/http_interface/ebin -pa deps/recon/ebin -pa deps/resource_discovery/ebin -pa deps/simple_cache/ebin

ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11/erlang.mk/simple_cache_tcp (master)$ erl -config config/sys  -sname mynode3 -pa deps/tcp_interface/ebin -pa deps/resource_discovery/ebin -pa deps/simple_cache/ebin -pa deps/recon/ebin
Erlang/OTP 26 [erts-14.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V14.1 (press Ctrl+G to abort, type help(). for help)
(mynode3@centos7-mq1)1> application:ensure_all_started(tcp_interface).
{ok,[resource_discovery,simple_cache,tcp_interface]}


ericksun@centos7-mq1:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11/erlang.mk/simple_cache_tcp (master)$ telnet localhost 1155
Trying ::1...
telnet: connect to address ::1: Connection refused
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
lookup[foo]
OK:{error,not_found}.
insert[foo,bar]
OK:ok.
lookup[foo]
OK:{ok,bar}.
delete[foo]
OK:ok.
lookup[foo]
OK:{error,not_found}.
insert[foo,bar]
OK:ok.
lookup[foo]
OK:{ok,bar}.

