%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(socket_examples_1).
-compile(export_all).
-import(lists, [reverse/1]).

%nano_get_url() ->
start() ->
    nano_get_url("www.baidu.com").

nano_get_url(Host) ->
    {ok,Socket} = gen_tcp:connect(Host,80,[binary, {packet, 0}]), %% (1)
    ok = gen_tcp:send(Socket, "GET / HTTP/1.0\r\n\r\n"),  %% (2)
    receive_data(Socket, []).

receive_data(Socket, SoFar) ->
    receive
	{tcp,Socket,Bin} ->    %% (3)
	    receive_data(Socket, [Bin|SoFar]);
	{tcp_closed,Socket} -> %% (4)
	    list_to_binary(reverse(SoFar)) %% (5)
    end.

