-module(my_module).
-behavior(gen_happy).
-compile(export_all).
-compile(nowarn_export_all).

% 为了防止warning，编译选项增加 -pa ./
% 参数和声明的不一致
%
% my_module.erl:2:2: Warning: undefined callback function get_happy/0 (behaviour 'gen_happy')
% %    2| -behavior(gen_happy).
% %     |  ^
%

% 这个函数不匹配
get_happy() ->
    {"no param Yay!", stop, hello}.

% 这个是正常的
get_happy() ->
    {ok, hello, stop}.
%-callback get_happy() -> {'ok', Reply :: term(), 'stop'}.

%  把函数注释掉，可以体会一下警告的作用
get_ecstatic() ->
    "Wow, Wow, OMG, Yes, Yes!".

start() ->
    io:format("result:~p~n", [get_happy()]),
    "this is an end".
