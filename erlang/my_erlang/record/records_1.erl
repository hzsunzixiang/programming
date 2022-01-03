-module(records_1).
-compile(export_all).
-compile(nowarn_export_all).

-record(robot, {name,
                type=industrial,
                hobbies,
                details=[]}).


first_robot() ->
    #robot{name="Mechatron",
           type=handmade, 
           details=["Moved by a small man inside"]}.
start() ->
   first_robot(),
   io:format("the firsh data= ~p~n",[first_robot()]).

% 预编译之后
%%  -file("records_1.erl", 1).
%%  
%%  -module(records_1).
%%  
%%  -compile(export_all).
%%  
%%  -compile(nowarn_export_all).
%%  
%%  -record(robot,{name, type = industrial, hobbies, details = []}).
%%  
%%  first_robot() ->
%%      {robot,
%%       "Mechatron",
%%       handmade, undefined,
%%       ["Moved by a small man inside"]}.
%%  
%%  start() ->
%%      first_robot(),
%%      io:format("the firsh data= ~p~n", [first_robot()]).
