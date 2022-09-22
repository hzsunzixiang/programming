-module(records_6).
-compile(export_all).
-compile(nowarn_export_all).

-record(robot, {name, type=industrial, hobbies, details=[]}).  
-record(person, { name, age, status = single }).  

first_robot() ->
    #robot{name="Mechatron",
           type=handmade, 
           details=["Moved by a small man inside"]}.

car_factory(CorpName) ->
    #robot{name=CorpName, hobbies="building cars"}.


is_person(P) when is_record(P, person) ->
    true;
is_person(_P) ->
    false.

start() ->
   X = car_factory("JokesWagen"),
   P = #person{name="hello"},
   NestedBot= #robot{details=#robot{name="erNest"}},
   io:format("is record = ~p~n",[is_record(X, robot)]),
   io:format("is record = ~p~n",[is_record(NestedBot, robot)]),
   io:format("is record = ~p~n",[is_record(NestedBot, person)]),
   io:format("is record = ~p~n",[is_person(X)]),
   io:format("is record = ~p~n",[is_person(P)]),
   'this is the end'.



