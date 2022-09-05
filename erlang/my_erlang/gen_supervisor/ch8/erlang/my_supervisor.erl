-module(my_supervisor).
-export([start/0, start/2, init/1, stop/1]).

start(Name, ChildSpecList) ->
    register(Name, Pid = spawn(?MODULE, init, [ChildSpecList])),
    {ok, Pid}.

stop(Name) -> Name ! stop.

init(ChildSpecList) ->
    process_flag(trap_exit, true),
    loop(start_children(ChildSpecList)).

start_children(ChildSpecList) ->
    [{element(2, apply(M,F,A)), {M,F,A}} || {M,F,A} <- ChildSpecList].


loop(ChildList) ->
    receive
	{'EXIT', Pid, normal} ->
	    loop(lists:keydelete(Pid,1,ChildList));
	{'EXIT', Pid, _Reason} ->
	    NewChildList = restart_child(Pid, ChildList),
	    loop(NewChildList);
	stop ->
	    terminate(ChildList)
    end.

restart_child(Pid, ChildList) ->
    {Pid, {M,F,A}} = lists:keyfind(Pid, 1, ChildList),
    {ok, NewPid} = apply(M,F,A),
    lists:keyreplace(Pid,1,ChildList,{NewPid, {M,F,A}}).

terminate(ChildList) ->
    lists:foreach(fun({Pid, _}) -> exit(Pid, kill) end, ChildList).

%%terminate([{Pid, _} | ChildList]) ->
%%    exit(Pid, kill),
%%    terminate(ChildList).
start()->
    my_supervisor:start(coffee_sup, [{coffee_fsm, start_link, []}]),
	Pid = whereis(coffee_fsm),
	io:format("Pid:~p~n", [Pid]),
	%exit(Pid, kill),
	%whereis(coffee_fsm),
	my_supervisor:stop(coffee_sup),
	%whereis(coffee_fsm),
	'this is an end'.
% 1> my_supervisor:start(coffee_sup, [{coffee_fsm, start_link, []}]).
% {ok,<0.60.0>}
% Machine:Rebooted Hardware
% Display:Make Your Selection
% 2> Pid = whereis(coffee_fsm).
% <0.61.0>
% 3> io:format("Pid:~p~n", [Pid]).
% Pid:<0.61.0>
% ok
% 4> exit(Pid, kill).
% Machine:Rebooted Hardware
% true
% Display:Make Your Selection
% 5> whereis(coffee_fsm).
% <0.65.0>
% 6> my_supervisor:stop(coffee_sup).
% stop
% 7> whereis(coffee_fsm).
% undefined

