-module(arithmetic_server).

-export([start/0, loop/0,  add/3, divide/3, multiply/3]).

% API Functions
start() ->
    spawn(?MODULE, loop, []).

add(ServerPid, X, Y) ->
    call(ServerPid, {add, X, Y}).

divide(ServerPid, X, Y) ->
    call(ServerPid, {divide, X, Y}).

multiply(ServerPid, X, Y) ->
    call(ServerPid, {multiply, X, Y}).

% Server loop
loop() ->
    receive
        {Pid, {add, X, Y}} ->
            Pid ! add(X, Y);
        {Pid, {divide, X, Y}} ->
            Pid ! divide(X, Y);
        {Pid, {multiply, X, Y}} ->
            Pid ! multiply(X, Y)
    end,
    loop().

% Private functions
call(ServerPid, Msg) ->
    ServerPid ! {self(), Msg},
    receive
        RespMsg -> RespMsg
    end.

add(X, Y) ->
    io:format("Got here~n"),
    X + Y.

divide(X, Y) ->
    X / Y.

multiply(X, Y) ->
    % intentionally naive multiply
    Result = lists:foldl(fun(_, Seq) ->
                                      X + Seq
                              end, 0, lists:seq(1, Y)),
    Result.
