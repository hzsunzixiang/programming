%% ---
-module(nano_server_active_false).
-compile(export_all).
-compile(nowarn_export_all).
%-define(packetLen, 4). 
%-define(portNumber, 5678). 
%-define(host, "localhost"). 


client(Client) ->
    SomeHostInNet = "localhost", % to make it runnable on one machine
    {ok, Sock} = gen_tcp:connect(SomeHostInNet, 5678, 
                                 [binary, {packet, 0}]),
    ok = gen_tcp:send(Sock, "Some Data"),
    ok = gen_tcp:close(Sock).

server() ->
    {ok, LSock} = gen_tcp:listen(5678, [binary, {packet, 0}, {reuseaddr, true}, {active, false}]),
    {ok, Sock} = gen_tcp:accept(LSock),
    {ok, Bin} = do_recv(Sock, []),
    ok = gen_tcp:close(Sock),
    ok = gen_tcp:close(LSock),
	io:format("Server received data= ~p~n",[Bin]),
    Bin.

do_recv(Sock, Bs) ->
    case gen_tcp:recv(Sock, 0) of
        {ok, B} ->
            do_recv(Sock, [Bs, B]);
        {error, closed} ->
            {ok, list_to_binary(Bs)}
    end.

start() ->
   server().

start(Client) ->
   client(Client).
