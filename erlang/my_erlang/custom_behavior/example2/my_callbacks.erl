-module(my_callbacks).
-behavior(my_behavior).
-export([fn/1, start/0]).

fn(A) -> A + 1.

start()->
    Res = my_behavior:function_in_behavior(),
    io:format("Res:~p~n", [Res]),
    'this is the end'.
