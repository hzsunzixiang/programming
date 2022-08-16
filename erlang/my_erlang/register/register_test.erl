%%%%% Naive version
%%%
-module(register_test). 
-export([start/0, call/2]). 

call(Arg1, Arg2) -> 
   io:fwrite("~p~n",[Arg1]). 

start() -> 
   Pid = spawn(?MODULE, call, ["hello", "process"]), 
   Ret = register(myprocess, Pid), 
   io:fwrite("~p~n",[Ret]),  % true
   io:fwrite("~p~n",[registered()]),
   'this is an end'.
