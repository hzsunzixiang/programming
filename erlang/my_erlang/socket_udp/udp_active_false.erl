%% ---
-module(udp_active_false).
-compile(export_all).
-compile(nowarn_export_all).

start_server() ->
    spawn(fun() -> server(4000) end).

%% The server 		  
server(Port) ->
    {ok, Socket} = gen_udp:open(Port, [binary, {active, false}]),
    io:format("server opened socket:~p~n",[Socket]),
    do_recv(Socket).

do_recv(Socket) ->
    case gen_udp:recv(Socket, 0) of
        %{ok,{{127,0,0,1},8790,<<"hey there">>}}
        {ok, {_Host, Port, Body}} = Msg ->
	        io:format("server received Body:~p~n",[Body]),
	        io:format("server received Msg:~p~n",[Msg]),
        %gen_udp:close(Socket)
        ok = gen_udp:send(Socket, _Host, Port, Body),
        do_recv(Socket)
    end.

%% The client
client(N) ->
    {ok, Socket} = gen_udp:open(0, [binary, {active, false}]),
    io:format("client opened socket=~p~n",[Socket]),
    ok = gen_udp:send(Socket, "localhost", 4000, "hey there" ),
    do_recv_client(Socket),
    gen_udp:close(Socket).

do_recv_client(Socket) ->
    case gen_udp:recv(Socket, 0) of
        %{ok,{{127,0,0,1},8790,<<"hey there">>}}
        {ok, {_Host, Port, Body}} = Msg ->
	        io:format("server received Body:~p~n",[Body]),
	        io:format("server received Msg:~p~n",[Msg]),
        gen_udp:close(Socket)
    end.

start() ->
   server(4000).

start(Number) ->
   [ListY|_] = Number,
   Ix = list_to_integer(atom_to_list(ListY)),
   io:format("the format value:=~p~n",[Ix]),
   client(Ix).
