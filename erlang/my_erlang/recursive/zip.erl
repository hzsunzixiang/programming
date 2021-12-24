-module(zip).
-export([zip/2, lenient_zip/2, start/0, tail_zip/2, tail_lenient_zip/2]).


%% reverses a list (a truly descriptive function name!)
reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

%% Takes two lists [A] and [B] and returns a list of tuples
%% with the form [{A,B}]. Both lists need to be of same lenght.
zip([],[]) -> [];
zip([X|Xs],[Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].


%% Same as zip/2, but lists can vary in lenght
lenient_zip([],_) -> [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs],[Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].

%% tail recursive version of zip/2
tail_zip(X,Y) -> reverse(tail_zip(X,Y,[])).

tail_zip([],[],Acc) -> Acc;
tail_zip([X|Xs],[Y|Ys], Acc) ->
    tail_zip(Xs,Ys, [{X,Y}|Acc]).

%% tail recursive version of lenient-zip/2
tail_lenient_zip(X,Y) -> reverse(tail_lenient_zip(X,Y,[])).

tail_lenient_zip([],_,Acc) -> Acc;
tail_lenient_zip(_,[],Acc) -> Acc;
tail_lenient_zip([X|Xs],[Y|Ys], Acc) ->
    tail_lenient_zip(Xs,Ys,[{X,Y}|Acc]).


%% tail recursive version of duplicate/2
tail_duplicate(N,Term) ->
    tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) ->
    List;
tail_duplicate(N,Term,List) when N > 0 ->
    tail_duplicate(N-1, Term+1, [Term|List]).

start() ->
       List1= tail_duplicate(10, 1),
       List2= tail_duplicate(10, 20),
       %io:format("Hello, World!~B~n", [fac(10)]).
       %io:format("Hello, World!~B~n", [tail_sum(10000000)]).
       io:format("Hello, World!~p~n", [tail_zip(List1, List2)]).
