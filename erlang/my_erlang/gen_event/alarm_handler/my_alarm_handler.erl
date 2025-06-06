%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(my_alarm_handler).
-behaviour(gen_event).

%% gen_event callbacks
-export([start/0, init/1, code_change/3, handle_event/2, handle_call/2, 
	 handle_info/2, terminate/2]).

%% init(Args) must return {ok, State}
%% The default simple handler is called alarm_handler and 
%% it can be exchanged by calling gen_event:swap_handler/3 as gen_event:swap_handler(alarm_handler, {alarm_handler, swap}, {NewHandler, Args}).
%% NewHandler:init({Args, {alarm_handler, Alarms}}) is called. For more details, see gen_event(3) in STDLIB.
init({Args, {alarm_handler, Alarms}}) ->
    io:format("in init here call  {Args:~p, {alarm_handler, Alarms:~p}}~n", ([Args, Alarms])),
    {ok, Args};
init(Args) ->
    io:format("*** my_alarm_handler init:~p~n",[Args]),
    {ok, 0}.

% The alarm handler is part of the SASL application.
% When writing new event handlers for the alarm handler, the following events must be handled:
% {set_alarm, {AlarmId, AlarmDescr}}
% This event is generated by alarm_handler:set_alarm({AlarmId, AlarmDecsr}).
% 原始的 alarm_handler 中有 AlarmId ， 这里可以不用了
handle_event({set_alarm, {AlarmId, tooHot}}, N) ->
    error_logger:error_msg("*** Tell the Engineer to turn on the fan AlarmId: ~p~n", [AlarmId]),
    {ok, N+1};
% {clear_alarm, AlarmId}
% This event is generated by alarm_handler:clear_alarm(AlarmId).
handle_event({clear_alarm, AlarmId}, N) ->
    error_logger:error_msg("*** Danger over. Turn off the fan AlarmId:~p~n", [AlarmId]),
    {ok, N-1};
handle_event(Event, N) ->
    io:format("*** unmatched event:~p~n",[Event]),
    {ok, N}.
    
handle_call(_Request, N) -> Reply = N, {ok, Reply,  N}.
handle_info(_Info, N)    -> {ok, N}.

terminate(swap, Num) ->
    {my_alarm_handler, Num};
terminate(_, _) ->
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

start() ->
    % The alarm handler process is a gen_event event manager process that receives alarms in the system. 
    alarm_handler:set_alarm({100, tooHot}),
    gen_event:swap_handler(alarm_handler, {alarm_handler, swap}, {my_alarm_handler, 0}),
	% swap_handler(EventMgrRef, {Handler1,Args1}, {Handler2,Args2}) 
    % 结合这里的参数 init({Args, {alarm_handler, Alarms}})
	% 第一个 alarm_handler参数 是 EventMgrRef
	% 第二个 alarm_handler参数 是 Handler1 
	% init 中的Args 是 Args2
	% init 中的 Alarms 是 已经产生的事件
	% in init here call  {Args:0, {alarm_handler, Alarms:[tooHot,tooHot]}}
    %alarm_handler:get_alarms(),
    alarm_handler:set_alarm({100, tooHot}),
    alarm_handler:clear_alarm(100),
    'this is an end'.

% 
% Then the new event handler Handler2 is added and initiated by calling Module2:init({Args2,Term}), where Module2 is the callback module of Handler2 and Term is the return value of Module1:terminate/2. This makes it possible to transfer information from Handler1 to Handler2.
% 
% otp/lib/sasl/src/alarm_handler.erl: 
% terminate(swap, Alarms) ->
%     {alarm_handler, Alarms};
% 

% {items,{"Installed handlers",
%         [{handler,alarm_handler,false,
%                   [{100,tooHot},{100,tooHot},{100,tooHot}],
%                   false}]}}
