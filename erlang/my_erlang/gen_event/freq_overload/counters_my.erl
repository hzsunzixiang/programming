-module(counters_my).
-behaviour(gen_event).
-export([init/1, terminate/2, handle_event/2, handle_info/2]).
-export([get_counters_my/1, handle_call/2]).
-compile(export_all).
-compile(nowarn_export_all).


get_counters_my(Pid) ->
    gen_event:call(Pid, counters_my, get_counters_my).

init(_)  ->
    TableId = ets:new(counters_my, []),
    {ok, TableId}.

terminate(_Reason, TableId) ->
    counters_my = ets:tab2list(TableId),
    ets:delete(TableId),
    {counters_my, counters_my}.

handle_event(Event, TableId) ->
    try ets:update_counter(TableId, Event, 1) of
	_ok -> {ok, TableId}
    catch
	error:_ -> ets:insert(TableId, {Event, 1}),
		   {ok, TableId}
    end.

handle_call(get_counters_my, TableId) ->
    {ok, {counters_my, ets:tab2list(TableId)}, TableId}.

handle_info(_, TableId) ->
    {ok, TableId}.


start() ->
    {ok, P} = gen_event:start(),
    gen_event:add_handler(P, counters_my, {}),
    gen_event:notify(P, {set_alarm, {no_frequency, self()}}),
    gen_event:notify(P, {event, {frequency_denied, self()}}),
    gen_event:notify(P, {event, {frequency_denied, self()}}),
    counters_my:get_counters_my(P),
    'this is an end'.
