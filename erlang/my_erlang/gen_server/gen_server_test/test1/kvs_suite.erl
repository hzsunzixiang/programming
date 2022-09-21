-module(kvs_suite).
-export([start/0]).

start() ->
  {ok, _} = kvs:start(),
  notfound = kvs:retrieve(x),
  ok = kvs:store(x, found),
  found = kvs:retrieve(x),
  ok.
