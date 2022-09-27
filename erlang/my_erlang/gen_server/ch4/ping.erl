-module(ping).
-behaviour(gen_server).

-export([init/1, handle_call/3, handle_info/2]).
-define(TIMEOUT, 5000).

init(_Args) ->
    {ok, undefined, ?TIMEOUT}.

% 这里启动的时候只触发一次
handle_call(start, _From, LoopData) ->
    {reply, started, LoopData, ?TIMEOUT};
handle_call(pause, _From, LoopData) ->
    {reply, paused, LoopData}.

handle_info(timeout, LoopData) ->
    {_Hour,_Min,Sec} = time(),
    io:format("~2.w~n",[Sec]),
    {noreply, LoopData, ?TIMEOUT}.
    % 如果这里 改成{noreply, LoopData, infinity}.
	% 则不会再定时触发了




% 1> gen_server:start({local,ping}, ping, [], []).
% {ok,<0.83.0>}
% 24
% 29
% 34
% 39
% 2> gen_server:call(ping,pause).

