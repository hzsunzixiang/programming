-module(tcp_print).
-export([init_request/0, get_request/2, stop_request/2, start_link/3, cast/0]).
-behaviour(tcp_wrapper).


init_request() ->
    io:format("Receiving Data~n*"), 
    {ok,[]}.
get_request(Data, Buffer)->
    io:format("&"),
    {ok, [Data|Buffer]}.
stop_request(_Reason, Buffer) ->
    io:format("~n"),
    io:format(lists:reverse(Buffer)),
    io:format("~n").

start_link(Module, Port, DbgOpts) ->
    tcp_wrapper:start_link(Module, Port, DbgOpts).
    %tcp_wrapper:start_link(?MODULE, Port, [trace, log]).

cast() ->
    tcp_wrapper:cast('127.0.0.1', 8080, 'hello,world.'),
    'this is the end'.
