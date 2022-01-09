-module(ets_update_op_default).
-compile([export_all]).
-compile(nowarn_export_all).


%
% update_counter(Tab, Key, UpdateOp, Default) -> Result
% UpdateOp = {Pos, Incr} | {Pos, Incr, Threshold, SetValue}
% Default = tuple()
% If a default object Default is specified, it is used as the object to be updated if the key is missing from the table. The value in place of the key is ignored and replaced by the proper key value. The return value is as if the default object had not been used, that is, a single updated element or a list of them.
func() ->
	 Table = ets:new(mytable, [named_table, set]),
	 %ets:insert(Table, {10, 10, 4 ,"description"}),
     io:format("result:~p~n", [ets:tab2list(Table)]),
	 ets:update_counter(Table, 10 , {3,1}, {10, 10, 4 ,"description"}),        
     io:format("result:~p~n", [ets:tab2list(Table)]),
     'this is an end'.



start() ->
     func(),
     'this is an end'.
