
-module(macro).
-export([add/2, add/3]).
-author("eric").
-define(HOUR, 3600).

add(A,B) ->
    A + B.

add(A,B,C) ->
    Result = A + B +C + ?HOUR.
%    io:format("Hello, world!~s ~n", Result).

%% erlc -E macro.erl 之后
%% -file("macro.erl", 1).
%% 
%% -module(macro).
%% 
%% -export([add/2,add/3]).
%% 
%% add(A, B) ->
%%     A + B.
%% 
%% add(A, B, C) ->
%%     A + B + C + 3600.
