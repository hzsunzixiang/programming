-module(my_server).
-export([start/2, start_link/2, call/2, cast/2, reply/2]).

%%% Public API
start(Module, InitialState) ->
    spawn(fun() -> init(Module, InitialState) end).

start_link(Module, InitialState) ->
    spawn_link(fun() -> init(Module, InitialState) end).


%%%%% 这里对应处理客户端的,  客户端发给服务器
%%% 这里的Pid 是服务端进程
call(ServerPid, Msg) ->
    Ref = erlang:monitor(process, ServerPid),
	% 这其中的self() 是客户端Pid ClientFrom
    ServerPid ! {sync, self(), Ref, Msg},
    receive
        {Ref, Reply} ->
            erlang:demonitor(Ref, [flush]),
            Reply;
        {'DOWN', Ref, process, ServerPid, Reason} ->
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
    LoopStatus = Module:init(InitialState),
    loop(Module, LoopStatus).

% 函数会返回  LoopState
loop(Module, LoopStatus) ->
    receive
        {sync, ClientFrom, Ref, Msg} ->
             {reply, Reply, NewState} = Module:handle_call(Msg, ClientFrom, LoopStatus),
             io:format("in loop LoopStatus: ~p~n",[NewState]),
		     reply({ClientFrom, Ref}, Reply),
			 loop(Module, NewState);
        {async, ClientFrom, Ref, Msg} ->
             {noreply, NewState} = Module:handle_cast(Msg, LoopStatus),
		     reply({ClientFrom, Ref}, ok),
			 loop(Module, NewState)
    end.

