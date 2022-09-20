-module(my_module).
-behavior(gen_happy).
-compile(export_all).
-compile(nowarn_export_all).

get_happy() ->
    "Yay!".

get_ecstatic() ->
    "Wow, Wow, OMG, Yes, Yes!".

start() ->
    io:format("result:~p~n", [get_happy()]),
    "this is an end".
