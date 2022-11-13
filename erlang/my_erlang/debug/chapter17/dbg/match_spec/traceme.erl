-module(traceme).
-compile(export_all).
-compile(nowarn_export_all).

foo(Var) ->
    io:format("in the foo ~p~n", [Var]).
bar(Var1, Var2) ->
    io:format("in the foo ~p~p~n", [Var1, Var2]).

baz(Var1, Var2, Var3) ->
    io:format("in the foo ~p~p~p~n", [Var1, Var2, Var3]).
