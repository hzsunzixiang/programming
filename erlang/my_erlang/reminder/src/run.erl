%% Event server
-module(run).
-compile(export_all).
-compile(nowarn_export_all).

start()->
    evserv:start(),
    evserv:subscribe(self()),
    evserv:add_event("Hey there", "test", calendar:local_time()),
    Return = evserv:listen(5),
	io:format("return ~p ~n", [Return]),
	'this is an end'.
%1> evserv:start().
%<0.82.0>
%2> evserv:subscribe(self()).
%{ok,#Ref<0.2173301855.160956420.72177>}
%3> evserv:add_event("Hey there", "test", calendar:local_time()).
%Now: {{2022,1,8},{4,15,13}} , ToGo: 0
%ok
%4> evserv:listen(5).
%[{done,"Hey there","test"}]
%
% 这样执行
%ericksun@centos-1:~/programming/erlang/my_erlang/reminder$ erl -pa ebin/  -noshell -s run start
%Now: {{2022,1,8},{4,21,25}} , ToGo: 0
%return [{done,"Hey there","test"}]
%
