-module(my_event).
-compile(export_all).
-compile(nowarn_export_all).
-record(state,{server, name="", to_go=0}).



loop(S = #state{server=Server})->
    receive
        {Server, Ref, cancel} ->
        Server!{Ref, ok}
    after S#state.to_go*1000 ->
        Server ! {done, S#state.name} 
	end.

start1()->
     spawn(my_event, loop, [#state{server=self(), name="testTime", to_go=1}]),
	 receive
        {Ref, ok} ->
	         io:format("return : ~p ~n", [Ref]);
        {done, Name} ->
	         io:format("return : ~p ~n", [Name])
	 end,
    'this is an end'.

start2()->
     Pid =spawn(my_event, loop, [#state{server=self(), name="test", to_go=500}]),
     ReplyRef = make_ref(),
     Pid ! {self(), ReplyRef, cancel},
	 receive
        {Ref, ok} ->
	         io:format("return : ~p ~n", [Ref]);
        {done, Name} ->
	         io:format("return : ~p ~n", [Name])
	 end,
    'this is an end'.


start()->
    start1(),
    start2().
%% spawn(my_event, loop, [#state{server=self(), name="test", to_go=5}]).
%% Pid =spawn(my_event, loop, [#state{server=self(), name="test", to_go=500}]).
%% ReplyRef = make_ref().
%% Pid ! {self(), ReplyRef, cancel}.
