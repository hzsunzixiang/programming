mkdir ernie2
cd ernie2
rebar3 new release bsc desc="Base Station Controller"




github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ rebar3 shell
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling bsc
Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

Eshell V12.2  (abort with ^G)
1> ===> Booted syntax_tools
===> Booted compiler
===> Booted goldrush
===> Booted lager
===> Booted bsc
===> Booted sasl

1>
1> application:which_applications().
[{sasl,"SASL  CXC 138 11","4.1.1"},
 {bsc,"Base Station Controller","1.0"},
 {lager,"Erlang logging framework","3.9.2"},
 {goldrush,"Erlang event stream processor","0.1.9"},
 {compiler,"ERTS  CXC 138 10","8.0.4"},
 {syntax_tools,"Syntax tools","2.6"},
 {inets,"INETS  CXC 138 49","7.5"},
 {ssl,"Erlang/OTP SSL application","10.6"},
 {public_key,"Public key infrastructure","1.11.3"},
 {asn1,"The Erlang ASN1 compiler version 5.0.17","5.0.17"},
 {crypto,"CRYPTO","5.0.5"},
 {stdlib,"ERTS  CXC 138 10","3.17"},
 {kernel,"ERTS  CXC 138 10","8.2"}]


github   25842  0.4  0.2 3155484 38200 pts/13  Sl+  16:18   0:01 /bin/rebar3 -B -sbtu -A1 -- -root /data/github/otp-install/lib/erlang -progname erl -- -home /data/github -- -boot no_dot_erlang -noshell -run escript start -extra /bin/rebar3 shell
github   26962  1.2  0.2 5061464 36584 pts/12  Sl+  16:22   0:00 /data/github/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc/_build/default/rel/bsc/bin/bsc -K true -A30 -- -root /data/github/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc/_build/default/rel/bsc -progname default/rel/bsc/bin/bsc -- -home /data/github -- -boot /data/github/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc/_build/default/rel/bsc/releases/1.0/start -mode embedded -boot_var SYSTEM_LIB_DIR /data/github/otp-install/lib/erlang/lib -config /data/github/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc/_build/default/rel/bsc/releases/1.0/sys.config -sname bsc -setcookie bsc_cookie -- -- console --

