-module(flag_return_trace_test).
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
        inner_fun(this_is_an_atom, 2),
        inner_fun_1(this_is_an_atom, 1000),
        inner_fun_2(world, b, {ok, hello}),
        inner_fun_3([c,d], 100),
        inner_fun_3("String", 200),
	    loop()
    end.


inner_fun(this_is_an_atom, Var) ->
    io:format("in the inner_fun ~p~n", [Var]),
    'this is an end'.
inner_fun_1(this_is_an_atom, Var) ->
    io:format("in the inner_fun_1 ~p~n", [Var]),
    'this is an end'.

inner_fun_2(Var, b, {ok, hello}) ->
    io:format("in the inner_fun_2 ~p~n", [Var]),
    'this is an end'.

inner_fun_3(Var, Var1) ->
    io:format("in the inner_fun_3 ~p~n", [Var]),
    'this is an end'.

