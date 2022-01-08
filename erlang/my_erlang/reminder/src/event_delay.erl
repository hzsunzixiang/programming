-module(event_delay).
-compile(export_all).
-compile(nowarn_export_all).
-record(state, {server,
                name="",
                to_go=0}).

%%% Public interface
start(EventName, Delay) ->
    spawn(?MODULE, init, [self(), EventName, Delay]).

start_link(EventName, Delay) ->
    spawn_link(?MODULE, init, [self(), EventName, Delay]).


cancel(Pid) ->
    %% Monitor in case the process is already dead
    Ref = erlang:monitor(process, Pid),
    Pid ! {self(), Ref, cancel},
    receive
        {Ref, ok} ->
            erlang:demonitor(Ref, [flush]),
	        io:format("demonitor return : ~p ~n", [Ref]),
            ok;
        {'DOWN', Ref, process, Pid, _Reason} ->
	        io:format("DOWN return : ~p ~n", [Ref]),
            ok
    end.

%%% Event's innards
init(Server, EventName, Delay) ->
    loop(#state{server=Server,
                name=EventName,
                to_go=normalize(Delay)}).

%% Loop uses a list for times in order to go around the ~49 days limit
%% on timeouts.
loop(S = #state{server=Server, to_go=[T|Next]}) ->
    receive
        {Server, Ref, cancel} ->
            Server ! {Ref, ok}
    after T*1000 ->
        if Next =:= [] ->
            Server ! {done, S#state.name};
           Next =/= [] ->
            loop(S#state{to_go=Next})
        end
    end.

%% Because Erlang is limited to about 49 days (49*24*60*60*1000) in
%% milliseconds, the following function is used
normalize(N) ->
    Limit = 49*24*60*60,
    [N rem Limit | lists:duplicate(N div Limit, Limit)].

%	24> [ 8888 rem 999 | lists:duplicate(8888 div 999, 999)].
%	[896,999,999,999,999,999,999,999,999]

start1()->
     %start("Event", 0),
     start("Event2", 1),
	 receive
        {Ref, ok} ->
	         io:format("return : ~p ~n", [Ref]);
        {done, Name} ->
	         io:format("return : ~p ~n", [Name])
	 end,
    'this is an end'.
start2()->
     Pid = start("Event2", 500),
	 cancel(Pid),
    'this is an end'.

start()->
    start1(),
    start2(),
    'this is an end'.
