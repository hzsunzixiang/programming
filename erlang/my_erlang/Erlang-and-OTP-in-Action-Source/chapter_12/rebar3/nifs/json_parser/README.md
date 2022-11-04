json_parser
=====

JSON parser (using NIFs)

Build
-----

    $ rebar3 compile


%%% 
ericksun@centos7-dev:~/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/rebar3/nifs/json_parser (master)$ LD_LIBRARY_PATH=/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/yajl_install/lib/  rebar3 shell

===> Verifying dependencies...


make: Entering directory `/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/rebar3/nifs/json_parser/c_src'
gcc -Wall -g   -fpic -shared  jp_nifs_R14.c -L/home/ericksun/program/otp-25.0.4/lib/erlang/lib/erl_interface-5.3/lib -L../../../../yajl_install//lib/ -lei_st -lyajl -I/home/ericksun/program/otp-25.0.4/lib/erlang/lib/erl_interface-5.3/include -I/home/ericksun/program/otp-25.0.4/lib/erlang/erts-13.0.4/include/ -I../../../../yajl_install/include/   -o ../priv/jp_nifs.so
make: Leaving directory `/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/rebar3/nifs/json_parser/c_src'
===> Analyzing applications...
===> Compiling json_parser
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1>
1> json_parser:parse_document(<<"[null,true,{\"int\":42,\"float\":3.14}]">>).
{ok,{undefined,true,[{<<"int">>,42},{<<"float">>,3.14}]}}

