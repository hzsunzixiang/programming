-module(ets_deadlock).
-compile([export_all]).
-compile(nowarn_export_all).

% {write_concurrency, true | false}
% https://learnyousomeerlang.com/ets#the-concepts-of-ets
% Usually, writing to a table will lock the whole thing and nobody else can access it, either for reading or writing to it, until the write is done. Setting this option to 'true' lets both reads and writes be done concurrently, without affecting the ACID properties of ETS. Doing this, however, will reduce the performance of sequential writes by a single process and also the capacity of concurrent reads. You can combine this option with 'read_concurrency' when both writes and reads come in large bursts.
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

