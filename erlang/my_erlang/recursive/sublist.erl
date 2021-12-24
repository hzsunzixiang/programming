-module(sublist).
-export([sublist/2, tail_sublist/2, start/0]).

%% returns the N first elements of a list
sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N-1)].


%% tail recursive version of reverse/1
tail_reverse(L) -> tail_reverse(L,[]).

tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).


%% tail recursive version of sublist/2
tail_sublist(L, N) -> tail_reverse(tail_sublist(L, N, [])).

tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 ->
    tail_sublist(T, N-1, [H|SubList]).

%% tail recursive version of duplicate/2
tail_duplicate(N,Term) ->
    tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) ->
    List;
tail_duplicate(N,Term,List) when N > 0 ->
    tail_duplicate(N-1, Term+1, [Term|List]).

start() ->
       ListTest = tail_duplicate(50, 1),
       %io:format("Hello, World!~B~n", [fac(10)]).
       %io:format("Hello, World!~B~n", [tail_sum(10000000)]).
       io:format("Hello, World!~p~n", [ListTest]),
       io:format("Hello, World!~p~n", [tail_sublist(ListTest, 20)]).
