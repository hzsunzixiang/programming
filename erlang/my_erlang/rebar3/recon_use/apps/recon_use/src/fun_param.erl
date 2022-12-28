-module(fun_param).

-export([start/0, partition_parallel/2]).

partition_parallel(F, Es) ->
    Parent = self(),
    Running = [{spawn_monitor(fun() -> Parent ! {self(), F(E)} end), E, helloworld} || E <- Es].


start()->
   partition_parallel(
       fun (C) ->
           io:format("hello:~p~n", [C])
       end, [1,2,3]).



