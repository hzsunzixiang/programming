json_parser
=====

JSON parser (using a port driver)

Build
-----

    $ rebar3 compile

%% 实验
LD_LIBRARY_PATH=/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/yajl_install/lib/  rebar3 shell

ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/yajl_install/lib/  rebar3 shell
===> Verifying dependencies...
make: Entering directory `/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/rebar3/port_driver/json_parser/apps/json_parser/c_src'
gcc -Wall -g   -fpic -shared  jp_driver.c -L/home/ericksun/program/otp-25.0.4/lib/erlang/lib/erl_interface-5.3/lib -L../../../../../../yajl_install/lib/ -lei_st -lyajl -I/home/ericksun/program/otp-25.0.4/lib/erlang/lib/erl_interface-5.3/include -I/home/ericksun/program/otp-25.0.4/lib/erlang/erts-13.0.4/include/ -I../../../../../../yajl_install/include/  -o ../priv/jp_driver.so
jp_driver.c:65:5: warning: initialization from incompatible pointer type [enabled by default]
     drv_output,                      /* output */
     ^
jp_driver.c:65:5: warning: (near initialization for ‘jp_driver_entry.output’) [enabled by default]
make: Leaving directory `/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/rebar3/port_driver/json_parser/apps/json_parser/c_src'
===> Analyzing applications...
===> Compiling json_parser
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> ===> Booted json_parser
===> Booted sasl

2> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.2"},
 {json_parser,"JSON parser (using a port driver)","0.1.0"},
 {inets,"INETS  CXC 138 49","8.0"},
 {ssl,"Erlang/OTP SSL application","10.8.3"},
 {public_key,"Public key infrastructure","1.13"},
 {asn1,"The Erlang ASN1 compiler version 5.0.19","5.0.19"},
 {crypto,"CRYPTO","5.1.1"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
3> json_parser:parse_document(<<"[null,true,{\"int\":42,\"float\":3.14}]">>).
{ok,{undefined,true,[{<<"int">>,42},{<<"float">>,3.14}]}}
4>

