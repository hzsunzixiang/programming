-module(map_2).
-compile(export_all).
-compile(nowarn_export_all).


%    Heights = #{ jack => 119.8, molly => 111.6, anthony => 93.71 },
start() ->
    New1 = maps:new(),
    New2 = #{},
    io:format("the map= ~p~n",[New1]),
    io:format("the map= ~p~n",[New2]),
    'this is the end'.

% 对比 record
% -record(robot, {name, type=industrial, hobbies, details=[]}).
% Robot = #robot{name="Mechatron", type=handmade, details=["Moved by a small man inside"]}.

