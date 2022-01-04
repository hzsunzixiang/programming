-module(spawn_1). 
-compile(export_all).
-compile(nowarn_export_all).

start() ->
   G = fun(X) -> timer:sleep(10), io:format("~p~n", [X]) end,
   [spawn(fun()->G(X) end) || X <- lists:seq(1, 10)].

