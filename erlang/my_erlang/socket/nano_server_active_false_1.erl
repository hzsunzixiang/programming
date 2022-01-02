%% ---
-module(nano_server_active_false_1).
-compile(export_all).
-compile(nowarn_export_all).
-import(lists, [reverse/1]).
-define(packetLen, 4). 
-define(portNumber, 5678). 
-define(host, "localhost"). 


%client(Client) ->
%    SomeHostInNet = ?host, % to make it runnable on one machine
%    {ok, Sock} = gen_tcp:connect(SomeHostInNet, ?portNumber, [binary, {packet, ?packetLen}]),
%    ok = gen_tcp:send(Sock, "Some Data"),
%
%    receive
%	{tcp,Sock,Data} ->
%	    io:format("Client received data= ~p~n",[Data]),
%        ok = gen_tcp:close(Sock)
%    end.


client(Client) ->
    SomeHostInNet = "localhost", % to make it runnable on one machine
    {ok, Sock} = gen_tcp:connect(SomeHostInNet, ?portNumber, [binary, {packet, ?packetLen}]),
    ok = gen_tcp:send(Sock, "Some Data"),
    ok = gen_tcp:close(Sock).

server() ->
    {ok, LSock} = gen_tcp:listen(?portNumber, [binary, {packet, ?packetLen}, {active, false}]),
    {ok, Sock} = gen_tcp:accept(LSock),
    {ok, Bin} = do_recv(Sock, []),
    ok = gen_tcp:close(Sock),
    ok = gen_tcp:close(LSock),
    Bin.

do_recv(Sock, Bs) ->
    case gen_tcp:recv(Sock, 0) of
        {ok, B} ->
            do_recv(Sock, [Bs, B]);
        {error, closed} ->
            {ok, list_to_binary(Bs)}
    end.

% server() ->
%     % 这里调用 socket bind listen 等系统调用
%     {ok, LSock} = gen_tcp:listen(?portNumber, [binary, {packet, ?packetLen}, {active, false}]),
% % active 为 true 或者 false ， 系统调用层面没看到任何差别
% % false
% %[pid 41180] socket(AF_INET, SOCK_STREAM, IPPROTO_TCP) = 17
% %[pid 41180] bind(17, {sa_family=AF_INET, sin_port=htons(5678), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
% %[pid 41180] listen(17, 5)               = 0
% 
% % true
% %[pid 41272] socket(AF_INET, SOCK_STREAM, IPPROTO_TCP) = 17
% %[pid 41272] bind(17, {sa_family=AF_INET, sin_port=htons(5678), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
% %[pid 41272] listen(17, 5)               = 0
%     {ok, Sock} = gen_tcp:accept(LSock),
% %[pid 41367] accept(17, 0x7f5fc01fbae0, [112]) = -1 EAGAIN (Resource temporarily unavailable)
% 
% % Receives a packet from a socket in passive mode. A closed socket is indicated by return value {error, closed}.
% % Argument Length is only meaningful when the socket is in raw mode and denotes the number of bytes to read. If Length is 0, all available bytes are returned. If Length > 0, exactly Length bytes are returned, or an error; possibly discarding less than Length bytes of data when the socket is closed from the other side.
%     {ok, Bin} = do_recv(Sock, []),
%     ok = gen_tcp:close(Sock),
%     ok = gen_tcp:close(LSock),
%     Bin.
% 
%     %timer:sleep(200000).
% do_recv(Sock, Bs) ->
%     case gen_tcp:recv(Sock, 0) of
%         {ok, B} ->
%             do_recv(Sock, [Bs, B]);
%         {error, closed} ->
%             {ok, list_to_binary(Bs)}
%     end.

start() ->
   server().

start(Client) ->
   client(Client).
