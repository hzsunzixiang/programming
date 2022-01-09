-module(ets_update_incr).
-compile([export_all]).
-compile(nowarn_export_all).


% update_counter(Tab, Key, Incr) -> Result
% UpdateOp = {Pos, Incr} | {Pos, Incr, Threshold, SetValue}
func() ->
	 Table = ets:new(mytable, [named_table, set]),
	 ets:insert(Table, {10, 10, 4 ,"description"}),
     io:format("result:~p~n", [ets:tab2list(Table)]),
	 ets:update_counter(Table, 10 , 99),        
     io:format("result:~p~n", [ets:tab2list(Table)]),
     'this is an end'.



start() ->
     func(),
     'this is an end'.
