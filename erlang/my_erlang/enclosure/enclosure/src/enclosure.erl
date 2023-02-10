-module(enclosure).
-compile(export_all).
-compile(nowarn_export_all).

start_infrastructure_fun(Sup, Conn, network) ->
    fun (Sock, ConnName) ->
            {ok, ChMgr} = start_channels_manager(Sup, Conn, ConnName, network),
            io:format("Sock:~p, ChMgr:~p~n",[Sup, ChMgr])
    end.

start_channels_manager(Sup, Conn, ConnName, network)->
    io:format("Sup:~p~n",[Sup]),
    {ok, world}.

