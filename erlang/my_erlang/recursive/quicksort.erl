-module(quicksort).
-export([quicksort/1, lc_quicksort/1, bestest_qsort/1, start/0]).

%% basic quicksort function.
quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot,Rest,[],[]),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
    if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
       H >  Pivot -> partition(Pivot, T, Smaller, [H|Larger])
    end. 

%% quicksort built with list comprehensions rather than with a
%% partition function.
lc_quicksort([]) -> [];
lc_quicksort([Pivot|Rest]) ->
    lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot])
    ++ [Pivot] ++
    lc_quicksort([Larger || Larger <- Rest, Larger > Pivot]).

%% BESTEST QUICKSORT, YEAH! 暂时还没看懂
%% (This is not really the bestest quicksort, because we do not do
%%  adequate pivot selection. It is the bestest of this book, alright?
%%  Thanks to literateprograms.org for this example. Give them a visit!
%%  http://en.literateprograms.org/Quicksort_(Erlang) )
bestest_qsort([]) -> [];
bestest_qsort(L=[_|_]) ->
    bestest_qsort(L, []).

bestest_qsort([], Acc) -> Acc;
bestest_qsort([Pivot|Rest], Acc) ->
    bestest_partition(Pivot, Rest, {[], [Pivot], []}, Acc).

bestest_partition(_, [], {Smaller, Equal, Larger}, Acc) ->
    bestest_qsort(Smaller, Equal ++ bestest_qsort(Larger, Acc));

bestest_partition(Pivot, [H|T], {Smaller, Equal, Larger}, Acc) ->
    if H < Pivot ->
           bestest_partition(Pivot, T, {[H|Smaller], Equal, Larger}, Acc);
       H > Pivot ->
           bestest_partition(Pivot, T, {Smaller, Equal, [H|Larger]}, Acc);
       H == Pivot ->
           bestest_partition(Pivot, T, {Smaller, [H|Equal], Larger}, Acc)
    end.

start() ->
       ListTest = [5, 4, 9, 7, 1, 8, 3, 2, 6],
       io:format("Hello, World!~p~n", [ListTest]),
       io:format("Hello, World!~p~n", [quicksort(ListTest)]),
       io:format("Hello, World!~p~n", [bestest_qsort(ListTest)]),
       io:format("Hello, World!~p~n", [lc_quicksort(ListTest)]).
