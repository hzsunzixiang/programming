-module(flag_return_to_test).
-export([start/0, send/1, loop/0]).


start() -> spawn_link(?MODULE, loop, []).

send(Pid) ->
    Pid ! {self(), ping},
    receive pong -> pong end.

loop() ->
    receive
	{Pid, ping} ->
	    %spawn(crash, do_not_exist, []),
	    Pid ! pong,
        inner_fun(),
	    loop()
    end.


inner_fun() ->
    io:format("hello,world~n").
