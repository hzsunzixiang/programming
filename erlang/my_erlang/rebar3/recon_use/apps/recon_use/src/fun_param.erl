-module(fun_param).

%-export([start/0, partition_parallel/2]).
-export([start/0, partition_parallel/3]).

partition_parallel(F, K,  Es) ->
    Parent = self(),
    Running = [{spawn_monitor(fun() -> Parent ! {F(E)} end), E, helloworld} || E <- Es].
    %Running = [{spawn_monitor(fun() -> Parent ! {self(), F(E)} end), E, helloworld} || E <- Es].
    %Running = [spawn_monitor(fun() -> F(E) end ) || E <- Es].
    %Running = [F(E) || E <- Es].
    %Running = [{F(E),K(E)} || E <- Es].


start()->
   partition_parallel(
       fun (C) ->
           io:format("hello:~p~n", [C])
       end, 
       fun (Y) ->
           io:format("world:~p~n", [Y])
       end, 
	   [1,2,3]).



