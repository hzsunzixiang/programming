-module(ping_normal).
-export([start/0, send/1, loop/0]).

start() -> spawn_link(ping_normal, loop, []).

send(Pid) ->
    Pid ! {self(), ping},
    receive pong -> pong end.

loop() ->
    receive
	{Pid, ping} ->
	    io:format("begin here ~n"),
	    Pid ! pong,
	    io:format("end here ~n"),
	    loop()
    end.
