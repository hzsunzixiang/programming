-module(my_module).
-behavior(gen_happy).
-compile(export_all).
-compile(nowarn_export_all).

% 为了防止warning，编译选项增加 -pa ./
get_happy() ->
    "Yay!".

%%  把函数注释掉，可以体会一下警告的作用
get_ecstatic() ->
    "Wow, Wow, OMG, Yes, Yes!".

start() ->
    io:format("result:~p~n", [get_happy()]),
    "this is an end".
