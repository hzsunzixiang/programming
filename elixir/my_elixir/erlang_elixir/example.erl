-module (example).
-export ([start/0, sum/2]).

sum(A, B) -> 
    A + B.

start() ->
    X = sum(2, 3),
    io:format("result: X: ~p~n", [X]).
