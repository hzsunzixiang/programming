coffee
=====

An OTP application

Build
-----

    $ rebar3 compile


%%%%%%%%%%%%%%%

rebar3 as prod compile && rebar3 as prod release
 _build/prod/rel/coffee/bin/coffee-0.1.0 console


%%%%%%%%%%%%%%%
cp apps/coffee/src/coffee.appup.src  _build/prod/lib/coffee/ebin/coffee.appup


rebar3 as prod compile && rebar3 as prod release

rebar3  as prod relup -n coffee -v "0.2.0" -u "0.1.0"

rebar3 as prod tar -n coffee -v "0.2.0"


 mv _build/prod/rel/coffee/coffee-0.2.0.tar.gz _build/prod/rel/coffee/releases/0.2.0/coffee.tar.gz
 
 
_build/default/rel/nine9s/bin/nine9s-0.1.0 upgrade "0.2.0"

ericksun@centos7-dev:~/programming/erlang/my_erlang/upgrade_as_prod/coffee (0.2.0)$ _build/prod/rel/coffee/bin/coffee-0.1.0 upgrade "0.2.0"
Release 0.2.0 not found, attempting to unpack releases/0.2.0/coffee.tar.gz
Unpacked successfully: "0.2.0"
Installed Release: 0.2.0
Made release permanent: "0.2.0"

%%%%%%%%%%%%%%%%%%%%%%55

result :


Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:30]

Eshell V13.0.4  (abort with ^G)
(coffee@centos7-dev)1>
(coffee@centos7-dev)1>
(coffee@centos7-dev)1>
(coffee@centos7-dev)1>
(coffee@centos7-dev)1> application
application               application_controller    application_master
application_starter
(coffee@centos7-dev)1> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.2"},
 {coffee,"An OTP application","0.1.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(coffee@centos7-dev)2> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.2"},
 {coffee,"An OTP application","0.2.0"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(coffee@centos7-dev)3>


