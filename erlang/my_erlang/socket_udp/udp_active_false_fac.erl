%% ---
-module(udp_active_false_fac).
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
        {ok, {Host, Port, Body}} = Msg ->
	        io:format("server received Msg:~p~n",[Msg]),
	        io:format("server received Body:~p~n",[Body]),
	        io:format("server received Body:~p~n",[binary_to_term(Body)]),
	        N = binary_to_term(Body),
	        Fac = fac(N),
	        gen_udp:send(Socket, Host, Port, term_to_binary(Fac)),
        do_recv(Socket)
    end.


fac(0) -> 1;
fac(N) -> N * fac(N-1).

%% The client
client(N) ->
    {ok, Socket} = gen_udp:open(0, [binary, {active, false}]),
    io:format("client opened socket=~p~n",[Socket]),
    ok = gen_udp:send(Socket, "localhost", 4000, term_to_binary(N) ),
    do_recv_client(Socket),
    gen_udp:close(Socket).

do_recv_client(Socket) ->
    case gen_udp:recv(Socket, 0) of
        %{ok,{{127,0,0,1},8790,<<"hey there">>}}
        {ok, {_Host, Port, Body}} = Msg ->
	        io:format("server received Msg:~p~n",[Msg]),
	        io:format("server received Body:~p~n",[Body]),
	        io:format("server received Body:~p~n",[binary_to_term(Body)]),
        gen_udp:close(Socket)
    end.

start() ->
   server(4000).

start(Number) ->
   [ListY|_] = Number,
   Ix = list_to_integer(atom_to_list(ListY)),
   io:format("the format value:=~p~n",[Ix]),
   client(Ix).
