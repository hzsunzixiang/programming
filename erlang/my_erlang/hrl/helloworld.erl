-module(helloworld). 
-export([start/0]). 
-include("user.hrl"). 

start() -> 
   P = #person{name = "John",id = 1}, 
   io:fwrite("~p~n",[P#person.id]), 
   io:fwrite("~p~n",[P#person.name]).
