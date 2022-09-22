-module(records_4).
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

repairman(Rob) ->
    Details = Rob#robot.details,
    NewRob = Rob#robot{details=["Repaired by repairman"|Details]},
    {repaired, NewRob}.


start() ->
    Rob=first_robot(),
	Repair = repairman(Rob),
    io:format("the firsh data= ~p~n",[Repair]),
	'this is the end'.
