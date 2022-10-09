-module(my_server).
-compile(export_all).
-compile(nowarn_export_all).
%-export([behaviour_info/1]).   % export_all 在这里不管用


%behaviour_info(callbacks) ->
%    [{handle_call, 3}, {handle_cast, 2}, {terminate, 2}, {init, 1}, {handle_info, 2}];
%behaviour_info(_) ->
%    undefined.


%%%% Public API
%start(Module, InitialState) ->
%    spawn(fun() -> init(Module, InitialState) end).
%
%start_link(Module, InitialState) ->
%    spawn_link(fun() -> init(Module, InitialState) end).
%%%
%
%start_link(Module) ->
%    start_link(Module, [], []).
%
%start_link(Module, InitialState, DbgOpts) ->
%    %proc_lib:start_link(Module, init, [self(), Module, InitialState, DbgOpts]).
%    proc_lib:spawn_link(Module, init, [self(), Module, InitialState, DbgOpts]).
%
%init(Parent, Module, InitialState, DbgOpts) ->
%    register(Module, self()),
%    process_flag(trap_exit, true),
%    Debug = sys:debug_options(DbgOpts),
%    proc_lib:init_ack({ok,self()}),
%    NewDebug = sys:handle_debug(Debug, fun debug/3, Module, init),
%    LoopStatus = Module:init(Parent, Module, InitialState, DbgOpts),
%    loop(Module, Parent, LoopStatus, NewDebug).
%%%%
%%%
%%%
%%%

start_link() ->
    proc_lib:start_link(kitty_server2, init, [self()]).

init(Parent) ->
    register(kitty_server2, self()),
    LoopStatus = [],
    NewDebug = sys:debug_options([]),
    proc_lib:init_ack(Parent, {ok, self()}),  % The new process must also acknowledge that it has been started to the parent:
	% proc_lib:start_link is synchronous and does not return until proc_lib:init_ack has been called.
	% 在这里成功就可以返回了
    % loop(Chs, Parent, Deb).
    loop(kitty_server2, Parent, LoopStatus, NewDebug).

% 函数会返回  LoopState
loop(Module, Parent, LoopStatus, Debug) ->
    receive
        {sync, ClientFrom, Ref, Msg} ->
             Result = Module:handle_call(Msg, ClientFrom, LoopStatus),
             case Result of
                 {reply, Reply, NewState} -> 
                     io:format("sync in loop LoopStatus: ~p~n",[NewState]),
	                 sys:handle_debug(Debug, fun debug/3, Module, {reply, Reply, NewState}),
		             reply({ClientFrom, Ref}, Reply),
			         loop(Module, Parent, NewState, Debug);
                 {stop, normal, ok, NewState} ->
                     io:format("sync in loop LoopStatus stop: ~p~n",[NewState]),
	                 sys:handle_debug(Debug, fun debug/3, Module, {stop, normal, ok, NewState}),
                     io:format("will stop: sync in loop ~n"),
                     ok = Module:terminate(normal, LoopStatus),
		             reply({ClientFrom, Ref}, normal, terminate)
             end;
        {async, Msg} ->
             {noreply, NewState} = Module:handle_cast(Msg, LoopStatus),
	         sys:handle_debug(Debug, fun debug/3, Module, {async, Msg}),
             io:format("async in loop LoopStatus: ~p~n",[NewState]),
			 loop(Module, Parent, NewState, Debug);
	    {stop, From}  ->
             io:format("will stop:from stop function sync in loop ~p~n", [From]),
	         sys:handle_debug(Debug, fun debug/3, Module, {stop, From}),
	         Module:terminate(nomal, LoopStatus);
	    {system,From,Msg} ->	%% The system messages.
	         sys:handle_system_msg(Msg, From, Parent, Module, Debug, {Module, LoopStatus})
    end.


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




debug(Dev, Event, Module) ->
    io:format(Dev, "mutex ~w: ~w~n", [Module,Event]).


system_continue(Parent, Debug, {Module, LoopStatus}) ->
    loop(Module, Parent, LoopStatus, Debug).

