-module(test).
-compile([export_all]).
-compile(nowarn_export_all).


func2() ->
     Table = ets:new(table, [set, {write_concurrency, true}]),

     lists:foreach(fun(_) ->
       {A1,A2,A3} = now(),
       random:seed(A1, A2, A3),
       ListRandom = [random:uniform(255) || _ <- lists:seq(1, 10)],
       Bytes = list_to_binary(ListRandom),
       io:format("Bytes:~p~n", [Bytes]),
       ets:update_counter(Table, Bytes, {2, 9}, {Bytes, 7}),
       %io:format("result:~p~n", [ets:tab2list(Table)])
       'this is an end'
     end, lists:seq(1, 50000)).

start() ->
     func2(),
     'this is an end'.

