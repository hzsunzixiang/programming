-module(event_datatime).
%-export([start/2, start_link/2, cancel/1]).
%-export([init/3, loop/1]).
-compile(export_all).
-compile(nowarn_export_all).
-record(state, {server,
                name="",
                to_go=0}).

%%% Public interface
start(EventName, DateTime) ->
    spawn(?MODULE, init, [self(), EventName, DateTime]).

start_link(EventName, DateTime) ->
    spawn_link(?MODULE, init, [self(), EventName, DateTime]).

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
init(Server, EventName, DateTime) ->
    loop(#state{server=Server,
                name=EventName,
                to_go=time_to_go(DateTime)}).

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

%%% private functions
time_to_go(TimeOut={{_,_,_}, {_,_,_}}) ->
    Now = calendar:local_time(),
    ToGo = calendar:datetime_to_gregorian_seconds(TimeOut) -
           calendar:datetime_to_gregorian_seconds(Now),
	io:format("Now: ~p , ToGo: ~p ~n", [Now, ToGo]),
    Secs = if ToGo > 0  -> ToGo;
              ToGo =< 0 -> 0
           end,
    normalize(Secs).

%% Because Erlang is limited to about 49 days (49*24*60*60*1000) in
%% milliseconds, the following function is used
normalize(N) ->
    Limit = 49*24*60*60,
    [N rem Limit | lists:duplicate(N div Limit, Limit)].


%	24> [ 8888 rem 999 | lists:duplicate(8888 div 999, 999)].
%	[896,999,999,999,999,999,999,999,999]


start1()->
     %start("Event", 0),
     start("Event2", calendar:local_time()),
	 receive
        {Ref, ok} ->
	         io:format("return : ~p ~n", [Ref]);
        {done, Name} ->
	         io:format("return : ~p ~n", [Name])
	 end,
    'this is an end'.
start2()->
     Pid = start("Event2", calendar:local_time()),
	 cancel(Pid),
    'this is an end'.

start()->
    start1(),
    start2(),
    'this is an end'.
