-module(barlib).

%% API
-export([start/0]). 
-include_lib("foo_nest/include/foo.hrl").


start() -> 
   P = #person{name = "John",id = 1}, 
   io:fwrite("~p~n",[P#person.id]), 
   io:fwrite("~p~n",[P#person.name]).
