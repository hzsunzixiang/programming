-module(ping_tracer).
-export([start/0, loop/0]).

start() -> spawn_link(ping, loop, []).

loop() ->
    receive
	   Msg  -> 
           io:format("Msg:~p~n", [Msg])
    end,
	loop().
