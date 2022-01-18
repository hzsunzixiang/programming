-module(ets_update_incr_default).
-compile([export_all]).
-compile(nowarn_export_all).


% update_counter(Tab, Key, Incr, Default) -> Result
% UpdateOp = {Pos, Incr} | {Pos, Incr, Threshold, SetValue}
func() ->
	 Table = ets:new(mytable, [named_table, set]),
	 %ets:insert(Table, {10, 10, 4 ,"description"}),
     io:format("result:~p~n", [ets:tab2list(Table)]),
	 % This function destructively update the object with key Key in table Tab by adding Incr to the element at position Pos. 
	 % The new counter value is returned.
	 % If no position is specified, the element directly following key (<keypos>+1) is updated.
	 %
	 % update_counter(Tab, Key, Incr, Default) -> Result
	 ets:update_counter(Table, 10, 99, {10, 10, 4 ,"description"} ),        
     io:format("result:~p~n", [ets:tab2list(Table)]),
     'this is an end'.



start() ->
     func(),
     'this is an end'.
