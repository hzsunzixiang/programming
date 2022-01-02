%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(nano_server_active_true).
-compile(export_all).
-compile(nowarn_export_all).
-import(lists, [reverse/1]).
-define(packetLen, 4). 
-define(portNumber, 2345). 
-define(host, "localhost"). 


nano_client_eval(Str) ->
    {ok, Socket} = 
	gen_tcp:connect("localhost", ?portNumber,
			[binary, {packet, ?packetLen}]),
    ok = gen_tcp:send(Socket, Str),
    receive
	{tcp,Socket,Data} ->
	    io:format("Client received data= ~p~n",[Data]),
	    gen_tcp:close(Socket)
    end.


%当一个主动套接字被创建后，它会在收到数据时向控制进程发送{tcp, Socket, Data}
%消息。控制进程无法控制这些消息流。恶意的客户端可以向系统发送成千上万的消息，
%而它们都会被发往控制进程。控制进程无法阻止这些消息流。
start_nano_server() ->
    {ok, Listen} = gen_tcp:listen(?portNumber, [binary, {packet, ?packetLen},  %% (6)
					 {reuseaddr, true},
					 {active, true}]),
    {ok, Socket} = gen_tcp:accept(Listen),  %% (7)
    gen_tcp:close(Listen),  %% (8)
    loop(Socket).


loop(Socket) ->
    receive
	{tcp, Socket, Data} ->
	    io:format("Server received data= ~p~n",[Data]),
	    gen_tcp:send(Socket, Data),  %% (11)
	    loop(Socket);
	{tcp_closed, Socket} ->
	    io:format("Server socket closed~n")
    end.

start() ->
   start_nano_server().

start(Client) ->
   nano_client_eval("hello").
