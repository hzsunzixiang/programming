-module(test).
-compile([export_all]).
-compile(nowarn_export_all).

func2() ->
     Table = ets:new(table, [set, {write_concurrency, true}]),

     lists:foreach(fun(_) ->
       Bytes = crypto:strong_rand_bytes(10),
       io:format("Bytes:~p~n", [Bytes]),
       ets:update_counter(Table, Bytes, {2, 9}, {Bytes, 7}),
       'this is an end'
     end, lists:seq(1, 50000)).


start() ->
     func2(),
     'this is an end'.

