-module(records_2).
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

car_factory(CorpName) ->
    #robot{name=CorpName, hobbies="building cars"}.

start() ->
   X = car_factory("JokesWagen"),
   NestedBot= #robot{details=#robot{name="erNest"}},
   io:format("the firsh data= ~p~n",[X]),
   io:format("the firsh data= ~p~n",[NestedBot]),
   io:format("the firsh data= ~p~n",[(NestedBot#robot.details)#robot.name]),
   io:format("the firsh type= ~p~n",[#robot.type]),
   io:format("the firsh data= ~p~n",[X#robot.hobbies]).

