-module(linkmon_1).
-compile(export_all).
-compile(nowarn_export_all).

chain(0) ->
    receive
        _ -> ok
        after 2000 ->
        exit("chain dies here")
    end;
chain(N) ->
    Pid = spawn(fun() -> chain(N-1) end),
    link(Pid),
    receive
        _ -> ok
    end.

