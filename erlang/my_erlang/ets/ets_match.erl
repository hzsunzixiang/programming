-module(ets_match).
-compile([export_all]).
-compile(nowarn_export_all).

start() ->

    TabId = ets:new(table, [named_table, bag]),
	io:format("lookup Result:~p~n", [TabId]),
    ets:insert(table, [{items, a, b, c, d}, {items, a, b, c, a}, {cat, brown, soft, loveable, selfish}, {friends, [jenn,jeff,etc]}, {items, 1, 2, 3, 1}]),
	io:format("lookup Result:~p~n", [ets:i()]),
    Res1 = ets:match(table, {items, '$1', '$2', '_', '$1'}),
    Res2 = ets:match(table, {items, '$114', '$212', '_', '$6'}),
    Res3 = ets:match_object(table, {items, '$1', '$2', '_', '$1'}),
    ets:delete(table),
	io:format("lookup Result:~p~n", [[Res1, Res2, Res3]]),

    'this is an end'.

% lookup Result:table
%  id              name              type  size   mem      owner
%  ----------------------------------------------------------------------------
% ....
%  table           table             bag   5      358      <0.9.0>
%  #Ref<0.1993972488.3878289409.68394> code              set   353    13524    code_server
%  #Ref<0.1993972488.3878289409.68435> rex_nodes_observer set   0      305      <0.54.0>
% lookup Result:ok
% lookup Result:[[[1,2],[a,b]],
%                [[1,1,2],[a,a,b],[d,a,b]],
%                [{items,1,2,3,1},{items,a,b,c,a}]]

