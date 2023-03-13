ticktime
=====

net_ticktime in erlang node

Build
-----

    $ rebar3 compile


erl -pa ./_build/default/lib/recon/ebin ./_build/default/lib/ticktime/ebin -sname apple@centos7-mq1 -kernel inet_dist_listen_min 25672 inet_dist_listen_max 25680 net_ticktime 360 net_tickintensity 10 
