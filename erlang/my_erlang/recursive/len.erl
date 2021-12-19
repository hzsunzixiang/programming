
-module(len).
-export([len/1, start/0]).

len([]) -> 0;
len([_|T]) -> 1+len(T).

start() ->
       io:format("Hello, World!~B~n", [len(lists:seq(1,10))]).
