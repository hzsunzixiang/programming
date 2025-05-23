-module(counters).
-behaviour(gen_event).
%-export([init/1, terminate/2, handle_event/2, handle_info/2]).
%-export([get_counters/1, handle_call/2]).
-compile(export_all).
-compile(nowarn_export_all).


get_counters(Pid) ->
    Reply = gen_event:call(Pid, counters, get_counters),
	io:format("Reply:~p~n", [{Reply}]),
	'this is an end'.

init(_)  ->
    TableId = ets:new(counters, []),
    {ok, TableId}.

terminate(_Reason, TableId) ->
    counters = ets:tab2list(TableId),
    ets:delete(TableId),
    {counters, counters}.

handle_event(Event, TableId) ->
    try ets:update_counter(TableId, Event, 1) of
	_ok -> {ok, TableId}
    catch
	error:_ -> ets:insert(TableId, {Event, 1}),
		   {ok, TableId}
    end.

handle_call(get_counters, TableId) ->
    {ok, {counters, ets:tab2list(TableId)}, TableId}.

handle_info(_, TableId) ->
    {ok, TableId}.


start() ->
    {ok, P} = gen_event:start(),
    gen_event:add_handler(P, counters, {}),
    gen_event:notify(P, {set_alarm, {no_frequency, self()}}),
    gen_event:notify(P, {event, {frequency_denied, self()}}),
    gen_event:notify(P, {event, {frequency_denied, self()}}),
    counters:get_counters(P),
    'this is an end'.
