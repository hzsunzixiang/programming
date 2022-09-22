-module(map_1).
-compile(export_all).
-compile(nowarn_export_all).

%https://learnyousomeerlang.com/maps
% Maps Module            Maps Syntax
% maps:new/1             #{}
% maps:put/3             Map#{Key => Val}
% maps:update/3	         Map#{Key := Val}
% maps:get/2             Map#{Key}
% maps:find/2            #{Key := Val} = Map


find_f(Heights) ->
    maps:find(molly, Heights).
	%after find in the map= {ok,111.6}

find_f2(Heights) ->
    #{molly := 111.6} = Heights.
	%after find in the map= #{anthony => 93.71,jack => 119.8,molly => 111.6}


update_f(Heights) ->
    UpdateHeights = maps:update(molly, 88.5, Heights).

update_f2(Heights) ->
    Heights#{molly := 833.222}.

put_in(Heights) ->
    MoreHeights = maps:put(sarah, 98.9, Heights).


% 这是添加的一种方式
put_in2(Heights) ->
	Heights#{sarah_1 => 100}.

% 对比 record修改记录的方式 Rob#robot{details='123'}
%    NewRob = Rob#robot{details=["Repaired by repairman"|Details]},

remove_out(Heights) ->
    FewerHeights = maps:remove(jack, Heights).

start() ->
    Heights = #{ jack => 119.8, molly => 111.6, anthony => 93.71 },
    io:format("the map= ~p~n",[Heights]),
    Jack = maps:get(jack, Heights),
    io:format("the map= ~p~n",[Jack]),
	XX = put_in(Heights),
    io:format("after put in the map= ~p~n", [XX]),
    io:format("after put in the map= ~p~n", [put_in(Heights)]),
    io:format("after put in the map= ~p~n", [put_in2(Heights)]),
    io:format("after remove in the map= ~p~n", [remove_out(Heights)]),
    io:format("after update in the map= ~p~n", [update_f(Heights)]),
    io:format("after update in the map= ~p~n", [update_f2(Heights)]),
    io:format("after find in the map= ~p~n", [find_f(Heights)]),
    io:format("after find in the map= ~p~n", [find_f2(Heights)]),
    'this is the end'.

% 对比 record
% -record(robot, {name, type=industrial, hobbies, details=[]}).
% Robot = #robot{name="Mechatron", type=handmade, details=["Moved by a small man inside"]}.

