-module(add).
-compile(nowarn_export_all).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X,Y) -> X() + Y().

start() ->
       io:format("Hello, World!~p~n", [add(fun one/0, fun two/0)]).
