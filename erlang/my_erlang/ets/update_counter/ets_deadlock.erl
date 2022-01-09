-module(ets_deadlock).
-compile([export_all]).
-compile(nowarn_export_all).

func() ->
     Table = ets:new(table, [set, {write_concurrency, true}]),

     lists:foreach(fun(_) ->
       Bytes = crypto:strong_rand_bytes(10),
       ets:update_counter(Table, Bytes, {2, 1}, {Bytes, 1})
     end, lists:seq(1, 10000)).

% https://www.erlang.org/doc/man/ets.html#update_counter-4
% update_counter(Tab, Key, UpdateOp, Default) -> Result
func1() ->
     Table = ets:new(table, [set, {write_concurrency, true}]),

     lists:foreach(fun(_) ->
       Bytes = crypto:strong_rand_bytes(10),
       io:format("Bytes:~p~n", [Bytes]),
       ets:update_counter(Table, Bytes, {2, 9}, {Bytes, 7}),
       io:format("result:~p~n", [ets:tab2list(Table)])
     end, lists:seq(1, 5)).



start() ->
     func1(),
     'this is an end'.

