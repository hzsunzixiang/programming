
-module(fib).
-export([start/0, fib_tail/1, fib/1, fib2/1, all_fibs/1]).

%% we defined two functions (data_types/0 and pattern_matching/0). To
%% define a function you write its name (atom), list of arguments in ()
%% separated with comman, arrow (->) and instructions that should be
%% exected.
%%
%% You can use pattern matching in function arguments part
fib(0) -> % if the argument is 0 then executed this version of function (clause)
    0; % value of last expressions is returned value (here it is 1). ';' separates clauses
fib(1) -> % if the argument is 1 then try this one
    1;
fib(N) -> % here we use unbound variable N. If previous clauses failed to match. This one is used. Argument is bound to N
    fib(N-1) + fib(N-2). % call fib functions twice (with different arguments) and return sum of their result
                         % . ends function definition (use it only in the last clause)

fib2(N) when N < 2 -> % this will be used only when N < 2. This is a guard.
    1;
fib2(N) ->
    fib(N-1) + fib(N-2).

%% function call
all_fibs(N) ->
    lists:map(fun fib/1, lists:seq(0,N)). % create new list with all elements E in [1..N] replaced with fib(E)


% tail recursive
% https://puredanger.github.io/tech.puredanger.com/2008/12/30/playing-with-erlang/
fib_tail(N) -> fib_iter(N, 0, 1).

fib_iter(0, Result, _Next) -> Result;

fib_iter(Iter, Result, Next) when Iter > 0 ->

fib_iter(Iter-1, Next, Result+Next).


start() ->
       %io:format("Hello, World!~B~n", [fib(100)]).
       %io:format("Hello, World!~B~n", [fib_tail(1000)]).
       %io:format("Hello, World!~p~n", [all_fibs(10)]).
       io:format("Hello, World!~p~n", [timer:tc(fib, fib, [40])]).



%A common technique when converting a recursive algorithm to an iterative one is to use a helper function that puts extra state in some additional parameters that can change during the iterative call. This example uses that technique by doing the real work in fib_iter/2 and just priming it with the proper values when you call fib/1.
%
%fib_iter takes three arguments – the first tells you how many more values of the sequence you need to compute and serves as what would be a decreasing loop index in an imperative language. The last two arguments are the last two values in the sequence, starting with 0 and 1 as the initial values. The first definition for fib_iter is the base case and says that when the iteration argument hits 0, the Result is the second argument and we just return it.
%
%An aside: _Next here is unused (but must exist to match the arity for fib_iter/2). In Erlang, variables starting with an _ are unused (often just _ is used but here I’ve named it to match the other definition for clarity). If I had just used Next here, Erlang would have warned me with something like: “./fib2.erl:6: Warning: variable ‘Next’ is unused”.
%
%The second definition has a guard (“when Iter > 0”) that indicates when it should be matched and just makes a single recursive call to itself (allowing tail recursion to kick in). You’ll notice that the first iterator argument is decremented, the most recent prior value moves from the 3rd arg to the 2nd, and we calculate the next value by adding the two incoming values.
%
