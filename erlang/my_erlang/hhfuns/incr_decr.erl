-module(incr_decr).
-compile(nowarn_export_all).
-compile(export_all).


one() -> 1.
two() -> 2.

add(X,Y) -> X() + Y().


increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].


map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

%fun(X) -> X+3 end.
base1(A) ->
    B = A + 1,
    F = fun() -> A * B end,
    F().
%X = fun() -> a end.
%PrepareAlarm = fun(Room) -> io:format("Alarm set in ~s.~n",[Room]) end.
%PrepareAlarm = fun(Room) -> a end.
	%fun() -> io:format("Alarm tripped in ~s! Call Batman!~n",[Room]) end
%	end.

start() ->
       L = [1,2,3,4,5],
       io:format("Hello, World!~p~n", [increment(L)]),
       io:format("Hello, World!~p~n", [map(fun(X)-> X + 3 end, L)]),
       io:format("Hello, World!~p~n", [map(fun incr/1, [3, 5, 6, 9])]).
