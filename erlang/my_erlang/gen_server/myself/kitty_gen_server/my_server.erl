-module(my_server).
-export([start/2, start_link/2, call/2, cast/2, reply/2]).

%%% Public API
start(Module, InitialState) ->
    spawn(fun() -> init(Module, InitialState) end).

start_link(Module, InitialState) ->
    spawn_link(fun() -> init(Module, InitialState) end).


%%%%% 这里对应处理客户端的,  客户端发给服务器
call(Pid, Msg) ->
    Ref = erlang:monitor(process, Pid),
    Pid ! {sync, self(), Ref, Msg},
    receive
        {Ref, Reply} ->
            erlang:demonitor(Ref, [flush]),
            Reply;
        {'DOWN', Ref, process, Pid, Reason} ->
            erlang:error(Reason)
    after 5000 ->
        erlang:error(timeout)
    end.

cast(Pid, Msg) ->
    Pid ! {async, Msg},
    ok.
%%%%% 上面对应处理客户端的

% 这里是服务端处理的返回
% {Pid, Ref} 对应loop循环中的同步调用信息, 异步不用
reply({Pid, Ref}, Reply) ->
    Pid ! {Ref, Reply}.

%%% Private stuff ,这里的Module是从调用者过来的
init(Module, InitialState) ->
    loop(Module, Module:init(InitialState)).

% 函数会返回  State
loop(Module, State) ->
    receive
        {async, Msg} ->
             loop(Module, Module:handle_cast(Msg, State));
        {sync, Pid, Ref, Msg} ->
             loop(Module, Module:handle_call(Msg, {Pid, Ref}, State))
    end.

