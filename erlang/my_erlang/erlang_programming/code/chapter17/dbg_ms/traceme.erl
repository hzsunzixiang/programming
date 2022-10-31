-module(traceme).
-compile(export_all).
-compile(nowarn_export_all).

%-export([start/0, send/1, loop/0]).
%
%start() -> spawn_link(ping, loop, []).
%
%
%loop() ->
%    receive
%	{Pid, ping} ->
%	    spawn(crash, do_not_exist, []),
%	    Pid ! pong,
%        %inner_fun(),
%	    loop()
%    end.
%

foo(Var) ->
    io:format("in the foo ~p~n", [Var]).
bar(Var1, Var2) ->
    io:format("in the foo ~p~p~n", [Var1, Var2]).

baz(Var1, Var2, Var3) ->
    io:format("in the foo ~p~p~p~n", [Var1, Var2, Var3]).
