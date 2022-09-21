-module(main).
-compile([export_all]).
-compile(nowarn_export_all).


% 如果不匹配会报错
%-spec add(integer(), integer(), integer()) -> integer().
%main.erl:7:2: spec for undefined function add/3
%%    7| -spec add(integer(), integer(), integer()) -> integer().
%%     |  ^

-spec add(integer(), integer()) -> integer().
add(A, B) ->
    A + B.

start() ->
    'this is the end'.
