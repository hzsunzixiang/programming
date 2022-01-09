-module(ets_update_op_list_default).
-compile([export_all]).
-compile(nowarn_export_all).


%
% update_counter(Tab, Key, X3 :: [UpdateOp], Default) -> [Result]
% UpdateOp = {Pos, Incr} | {Pos, Incr, Threshold, SetValue}
% A list of UpdateOp can be supplied to do many update operations within the object. 
func() ->
	 Table = ets:new(mytable, [named_table, set]),
	 %ets:insert(Table, {10, 10, 4 ,"description"}),
     io:format("result:~p~n", [ets:tab2list(Table)]),
	 ets:update_counter(Table, 10 , [{3,1}, {2,99}], {10, 10, 4 ,"description"}),
     io:format("result:~p~n", [ets:tab2list(Table)]),
     'this is an end'.



start() ->
     func(),
     'this is an end'.
