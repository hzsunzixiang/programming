hellorebar3
=====

An OTP application

Build
-----

    $ rebar3 compile


# 启动之后的进程是这样的
rebar3 shell
/usr/bin/rebar3 -B -sbtu -A1 -- -root /usr/lib64/erlang -progname erl -- -home /home/ericksun -- -boot no_dot_erlang -noshell -run escript start -extra /usr/bin/rebar3 shell


