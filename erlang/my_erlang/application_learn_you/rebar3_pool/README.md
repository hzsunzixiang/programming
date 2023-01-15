rebar3_pool
=====

ppool An OTP application

Build
-----

    $ rebar3 compile

rebar3_pool_suprebar3_pool_sup
ol:start_pool(nag, 2, {ppool_nagger, start_link, []}).
{ok,<0.142.0>}
2> ppool:run(nag, [make_ref(), 5000, 10, self()]).
{ok,<0.146.0>}
3> ppool:run(nag, [make_ref(), 5000, 10, self()]).
{ok,<0.149.0>}
4> ppool:run(nag, [make_ref(), 5000, 10, self()]).
noalloc

