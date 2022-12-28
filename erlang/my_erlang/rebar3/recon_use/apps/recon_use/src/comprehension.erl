-module(comprehension).

-export([start/0]).

start()->
    [begin erlang:display(N), N*10 end || N <- lists:seq(1,3)].



%[begin io:format("shell 1 ~p~n", [erlang:universaltime()]), timer:sleep(1000) end || _ <- lists:seq(1, 1000)].


