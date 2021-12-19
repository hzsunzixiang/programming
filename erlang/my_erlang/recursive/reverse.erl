-module(reverse).
-export([start/0, tail_reverse/1, reverse/1, tail_duplicate/2]).



%% reverses a list (a truly descriptive function name!)
%% 这个要一层层递归下去，再一层层返回
reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].


%% tail recursive version of reverse/1
%% 尾递归，由编译器优化，只需递归(循环一次), 不用再一层层返回，效率至少高一倍
tail_reverse(L) -> tail_reverse(L,[]).

tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).



%% tail recursive version of duplicate/2
tail_duplicate(N,Term) ->
    tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) ->
    List;
tail_duplicate(N,Term,List) when N > 0 ->
    tail_duplicate(N-1, Term+1, [Term|List]).

start() ->
       ListTest = tail_duplicate(50000, 1),
	   %ListTestReverse = tail_reverse(ListTest),
	   ListTestReverse = reverse(ListTest),
       io:format("Hello, World!~p~n", [ListTestReverse]).
       %io:format("Hello, World!~p~n", [tail_duplicate(50, 1)]).

% 耗时较久
%	   ListTestReverse = reverse(ListTest),

