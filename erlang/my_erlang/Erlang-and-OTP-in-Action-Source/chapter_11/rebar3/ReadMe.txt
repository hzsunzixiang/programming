
ericksun@centos7-dev:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11/rebar3/erlware_package (master)$ rebar3 shell --sname mynodex
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling tcp_interface
===> Compiling resource_discovery
===> Compiling erlware_package
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
(mynodex@centos7-dev)1>
(mynodex@centos7-dev)1> application:which_applications().
[{resource_discovery,"true","0.1.0"},
 {mnesia,"MNESIA  CXC 138 12","4.21.1"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {inets,"INETS  CXC 138 49","8.0"},
 {ssl,"Erlang/OTP SSL application","10.8.3"},
 {public_key,"Public key infrastructure","1.13"},
 {asn1,"The Erlang ASN1 compiler version 5.0.19","5.0.19"},
 {crypto,"CRYPTO","5.1.1"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(mynodex@centos7-dev)2> application:which_applications().
[{resource_discovery,"true","0.1.0"},
 {mnesia,"MNESIA  CXC 138 12","4.21.1"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {inets,"INETS  CXC 138 49","8.0"},
 {ssl,"Erlang/OTP SSL application","10.8.3"},
 {public_key,"Public key infrastructure","1.13"},
 {asn1,"The Erlang ASN1 compiler version 5.0.19","5.0.19"},
 {crypto,"CRYPTO","5.1.1"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(mynodex@centos7-dev)3> =INFO REPORT==== 3-Nov-2022::00:14:12.020402 ===
    application: mnesia
    exited: stopped
    type: temporary

===> Booted sasl
===> Booted mnesia
===> Booted resource_discovery
===> Booted erlware_package
===> Booted tcp_interface



ericksun@centos7-dev:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_11 (master)$ telnet localhost 1155
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
OK:{error,not_found}.
ERROR:{badmatch,{error,{1,erl_parse,["syntax error before: ","'.'"]}}}.
lookup[foo]
OK:{error,not_found}.
OK:{error,not_found}.
ERROR:{badmatch,{error,{1,erl_parse,["syntax error before: ","'.'"]}}}.
lookup[foo]
OK:{error,not_found}.
