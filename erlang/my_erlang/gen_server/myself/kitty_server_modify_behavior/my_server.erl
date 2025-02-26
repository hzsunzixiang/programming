-module(my_server).
-compile(export_all).
-compile(nowarn_export_all).
-export([behaviour_info/1]).   % export_all 在这里不管用


behaviour_info(callbacks) ->
    [{handle_call, 3}, {handle_cast, 2}, {terminate, 2}, {init, 1}, {handle_info, 2}];
behaviour_info(_) ->
    undefined.


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
        {Ref, normal, terminate} ->
            erlang:demonitor(Ref, [flush]);
        {Ref, Reply} ->
            erlang:demonitor(Ref, [flush]),
            Reply;
        {'DOWN', Ref, process, ServerPid, Reason} ->
            erlang:error(Reason)
    after 5000 ->
        erlang:error(timeout)
    end.

% 发送消息之后，不等回应，直接返回ok
cast(ServerPid, Msg) ->
    ServerPid ! {async, Msg},
    ok.
%%%%% 上面对应处理客户端的

% 这里是服务端处理的返回
% {Pid, Ref} 对应loop循环中的同步调用信息, 异步不用
reply({Pid, Ref}, Reply) ->
    Pid ! {Ref, Reply}.

% 这里是服务端处理的返回
% {Pid, Ref} 对应loop循环中的同步调用信息, 异步不用
reply({Pid, Ref}, normal, terminate) ->
    Pid ! {Ref, normal, terminate}.


stop(ServerPid) ->
    ServerPid ! {stop, self()},
	ok.

%%% Private stuff ,这里的Module是从调用者过来的
init(Module, InitialState) ->
    LoopStatus = Module:init(InitialState),
    loop(Module, LoopStatus).


% 函数会返回  LoopState
loop(Module, LoopStatus) ->
    receive
        {sync, ClientFrom, Ref, Msg} ->
             Result = Module:handle_call(Msg, ClientFrom, LoopStatus),
             case Result of
                 {reply, Reply, NewState} -> 
                     io:format("sync in loop LoopStatus: ~p~n",[NewState]),
		             reply({ClientFrom, Ref}, Reply),
			         loop(Module, NewState);
                 {stop, normal, ok, NewState} ->
                     io:format("sync in loop LoopStatus stop: ~p~n",[NewState]),
                     io:format("will stop: sync in loop ~n"),
                     ok = Module:terminate(normal, LoopStatus),
		             reply({ClientFrom, Ref}, normal, terminate)
             end;
        {async, Msg} ->
             {noreply, NewState} = Module:handle_cast(Msg, LoopStatus),
             io:format("async in loop LoopStatus: ~p~n",[NewState]),
			 loop(Module, NewState);
	    {stop, From}  ->
             io:format("will stop:from stop function sync in loop ~p~n", [From]),
	         Module:terminate(nomal, LoopStatus)
    end.

