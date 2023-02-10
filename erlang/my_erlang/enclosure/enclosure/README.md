enclosure
=====

An OTP application

Build
-----

    $ rebar3 compile


1> recon_trace:calls([{main,'_','_'}, {enclosure,'_','_'},{enclosure_sup,'_','_'}], 2000, [return_to, {scope, local}]).
7
2> main:start().
Sup:hello
Sock:hello, ChMgr:world
ok

22:29:00.338079 <0.153.0> enclosure_sup:start_infrastructure_fun(hello, <0.153.0>, network)

22:29:00.342290 <0.153.0>  '--> main:start/0

22:29:00.342397 <0.153.0> enclosure_sup:'-start_infrastructure_fun/3-fun-0-'(sock, connName, hello, <0.153.0>)

22:29:00.342512 <0.153.0> enclosure_sup:start_channels_manager(hello, <0.153.0>, connName, network)

22:29:00.342601 <0.153.0>  '--> enclosure_sup:'-start_infrastructure_fun/3-fun-0-'/4

22:29:00.342680 <0.153.0>  '--> main:start/0
3> self().
<0.153.0>

