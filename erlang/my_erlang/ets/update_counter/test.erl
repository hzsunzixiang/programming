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
       io:format("Bytes origin:~p~n", [Bytes]),
       %io:format("Bytes:~p~n", [ets:tab2list(Table)]),
	   % 这里 {2, 9} 表示对 第2个字段(7)累加一个数9
	   % Bytes  表示Key
	   % update_counter(Tab, Key, X3 :: [UpdateOp], Default) -> [Result]  opt18引入
       ets:update_counter(Table, Bytes, {2, 9}, {Bytes, 7}),
       %io:format("result:~p~n", [ets:tab2list(Table)]),
	   timer:sleep(3000),
       'this is an end'
     end, lists:seq(1, 50000)).

start() ->
     func2(),
     'this is an end'.
