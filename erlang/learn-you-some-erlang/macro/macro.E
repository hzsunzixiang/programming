-file("macro.erl", 1).

-module(macro).

-export([add/2,add/3]).

-author("eric").

add(A, B) ->
    A + B.

add(A, B, C) ->
    Result = A + B + C + 3600.



