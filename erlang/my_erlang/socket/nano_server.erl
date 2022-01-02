%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(nano_server).
-compile(export_all).
-compile(nowarn_export_all).
-import(lists, [reverse/1]).


% package lenth = 4
% Frame 4: 104 bytes on wire (832 bits), 104 bytes captured (832 bits)
% Linux cooked capture v1
% Internet Protocol Version 4, Src: 127.0.0.1, Dst: 127.0.0.1
% Transmission Control Protocol, Src Port: 52540, Dst Port: 2345, Seq: 1, Ack: 1, Len: 36
% Data (36 bytes)
%     Data: 00000020836b001c6c6973745f746f5f7475706c65285b322b332a342c31302b32305d29
%     [Length: 36]
% 
% package lenth = 2
% Frame 4: 104 bytes on wire (832 bits), 104 bytes captured (832 bits)
% Frame 4: 102 bytes on wire (816 bits), 102 bytes captured (816 bits)
% Linux cooked capture v1
% Internet Protocol Version 4, Src: 127.0.0.1, Dst: 127.0.0.1
% Transmission Control Protocol, Src Port: 52546, Dst Port: 2345, Seq: 1, Ack: 1, Len: 34
% Data (34 bytes)
%     Data: 0020836b001c6c6973745f746f5f7475706c65285b322b332a342c31302b32305d29
%     [Length: 34]

nano_client_eval(Str) ->
    {ok, Socket} = 
	gen_tcp:connect("localhost", 2345,
			[binary, {packet, 2}]),
    ok = gen_tcp:send(Socket, term_to_binary(Str)),
    receive
	{tcp,Socket,Bin} ->
	    io:format("Client received binary = ~p~n",[Bin]),
	    Val = binary_to_term(Bin),
	    io:format("Client result = ~p~n",[Val]),
	    gen_tcp:close(Socket)
    end.




%当一个主动套接字被创建后，它会在收到数据时向控制进程发送{tcp, Socket, Data}
%消息。控制进程无法控制这些消息流。恶意的客户端可以向系统发送成千上万的消息，
%而它们都会被发往控制进程。控制进程无法阻止这些消息流。
start_nano_server() ->
    {ok, Listen} = gen_tcp:listen(2345, [binary, {packet, 2},  %% (6)
					 {reuseaddr, true},
					 {active, true}]),
    {ok, Socket} = gen_tcp:accept(Listen),  %% (7)
    gen_tcp:close(Listen),  %% (8)
    loop(Socket).


loop(Socket) ->
    receive
	{tcp, Socket, Bin} ->
	    io:format("Server received binary = ~p~n",[Bin]),
	    Str = binary_to_term(Bin),  %% (9)
	    io:format("Server (unpacked)  ~p~n",[Str]),
	    Reply = lib_misc:string2value(Str),  %% (10)
	    io:format("Server replying = ~p~n",[Reply]),
	    gen_tcp:send(Socket, term_to_binary(Reply)),  %% (11)
	    loop(Socket);
	{tcp_closed, Socket} ->
	    io:format("Server socket closed~n")
    end.

start() ->
   start_nano_server().

start(Client) ->
   nano_client_eval("list_to_tuple([2+3*4,10+20])").
