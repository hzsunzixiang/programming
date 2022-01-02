%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(nano_server_active_false).
-compile(export_all).
-compile(nowarn_export_all).
-import(lists, [reverse/1]).


client(Client) ->
    SomeHostInNet = "localhost", % to make it runnable on one machine
    {ok, Sock} = gen_tcp:connect(SomeHostInNet, 5678, 
                                 [binary, {packet, 0}]),
    ok = gen_tcp:send(Sock, "Some Data"),
    ok = gen_tcp:close(Sock).

server() ->

    % 这里调用 socket bind listen 等系统调用
    {ok, LSock} = gen_tcp:listen(5678, [binary, {packet, 0}, 
                                        {active, false}]),

% active 为 true 或者 false ， 系统调用层面没看到任何差别
% false
%[pid 41180] socket(AF_INET, SOCK_STREAM, IPPROTO_TCP) = 17
%[pid 41180] bind(17, {sa_family=AF_INET, sin_port=htons(5678), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
%[pid 41180] listen(17, 5)               = 0

% true
%[pid 41272] socket(AF_INET, SOCK_STREAM, IPPROTO_TCP) = 17
%[pid 41272] bind(17, {sa_family=AF_INET, sin_port=htons(5678), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
%[pid 41272] listen(17, 5)               = 0

    {ok, Sock} = gen_tcp:accept(LSock),
%[pid 41367] accept(17, 0x7f5fc01fbae0, [112]) = -1 EAGAIN (Resource temporarily unavailable)

    {ok, Bin} = do_recv(Sock, []),
    ok = gen_tcp:close(Sock),
    ok = gen_tcp:close(LSock),
    Bin.

    %timer:sleep(200000).
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
