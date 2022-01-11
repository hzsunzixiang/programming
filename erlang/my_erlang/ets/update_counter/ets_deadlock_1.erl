-module(ets_deadlock_1).
-compile([export_all]).
-compile(nowarn_export_all).


func3() ->
     Table = ets:new(table, [set, {write_concurrency, true}]),

     lists:foreach(fun(_) ->
       %Bytes = crypto:strong_rand_bytes(10),
	   Bytes = random:uniform(),
       io:format("Bytes:~p~n", [Bytes]),
       ets:update_counter(Table, Bytes, {2, 9}, {Bytes, 7}),
	   timer:sleep(1000)
       %io:format("result:~p~n", [ets:tab2list(Table)])
     end, lists:seq(1, 50000)).

start() ->
     func3(),
     'this is an end'.

