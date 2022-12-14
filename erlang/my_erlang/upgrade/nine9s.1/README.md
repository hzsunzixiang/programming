nine9s
=====

https://medium.com/@kansi/hot-code-loading-with-erlang-and-rebar3-8252af16605b

An OTP application

Build
-----

    $ rebar3 compile

先解压:
tar xvf  dot.git.tar.gz 

_build/default/rel/nine9s/bin/nine9s-0.1.0 console
cp apps/nine9s/src/nine9s.appup.src  _build/default/lib/nine9s/ebin/nine9s.appup
rebar3 compile
rebar3 release

rebar3 relup -n nine9s -v 0.2.0 -u 0.1.0

rebar3 tar -n nine9s -v 0.2.0

mv _build/default/rel/nine9s/nine9s-0.2.0.tar.gz _build/default/rel/nine9s/releases/0.2.0/nine9s.tar.gz

_build/default/rel/nine9s/bin/nine9s-0.1.0  upgrade 0.2.0


