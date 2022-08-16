-module(apply_test).
-compile(export_all).
-compile(nowarn_export_all).

start() ->
    Res1 = apply(lists, reverse, [[a, b, c]]),
	io:format("Res1:~p~n", [Res1]),
    Res2 = apply(erlang, atom_to_list, ['Erlang']),
	io:format("Res2:~p~n", [Res2]),
	'this is an end'.
