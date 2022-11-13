
-module(my_tracer).

%-export([start/0, loop/0]).
-export([start/0]).

start() ->
  spawn(fun loop/0).

loop() ->
  receive
      % 打印更友好的消息格式
      {trace, Pid, send, Msg, To} ->
          % 处理send
          io:format("Process ~p sent message ~p to process ~p~n", [Pid, Msg, To]);
      {trace, Pid, 'receive', Msg} ->
          % 处理receive
          io:format("Process ~p received message ~p~n", [Pid, Msg]);
      {trace, Pid, return_from, {Module, Function, Arity}, ReturnValue} ->
          % 处理返回值
          io:format("Function ~p:~p/~p returned ~p in process ~p~n", 
          [Module, Function, Arity, ReturnValue, Pid]);
      {trace, Pid, call, {Module, Function, Arguments}} ->
          % 处理调用
          io:format("Function ~p:~p invoked with arguments ~p in process ~p~n",
          [Module, Function, Arguments, Pid]);
    Msg ->
      io:format("Received unexpected message ~p~n", [Msg])
  end,
  loop().  % 特别注意这里要循环

% {trace,<0.85.0>,'receive',{<0.81.0>,{multiply,4,3}}}
% 6> flush().
% Shell got {trace,<0.85.0>,call,{arithmetic_server,multiply,[4,3]}}
% Shell got {trace,<0.85.0>,call,
%                  {arithmetic_server,'-multiply/2-fun-0-',[1,0,4]}}
% Shell got {trace,<0.85.0>,return_from,
%                  {arithmetic_server,'-multiply/2-fun-0-',3},
%                  4}
% Shell got {trace,<0.85.0>,call,
%                  {arithmetic_server,'-multiply/2-fun-0-',[2,4,4]}}
% Shell got {trace,<0.85.0>,return_from,
%                  {arithmetic_server,'-multiply/2-fun-0-',3},
%                  8}
% Shell got {trace,<0.85.0>,call,
%                  {arithmetic_server,'-multiply/2-fun-0-',[3,8,4]}}
% Shell got {trace,<0.85.0>,return_from,
%                  {arithmetic_server,'-multiply/2-fun-0-',3},
%                  12}
% Shell got {trace,<0.85.0>,return_from,{arithmetic_server,multiply,2},12}
% Shell got {trace,<0.85.0>,send,12,<0.81.0>}
% Shell got 12
% Shell got {trace,<0.85.0>,call,{arithmetic_server,loop,[]}}
% ok


test()-> 
    % 启动跟踪模块
    Pid = my_tracer:start(),
    % 启动算数服务器，此时我们还没有启动跟踪器
    ServerPid = arithmetic_server:start(),
    
    % 开始进行跟踪
    erlang:trace(ServerPid, true, [call, send, 'receive', {tracer, Pid}]),
    
    % 设置模式跟踪
    erlang:trace_pattern({arithmetic_server, '_', '_'}, [{'_', [], [{return_trace}]}], [local]),
    
    % 执行算数服务器中的函数
    arithmetic_server:multiply(ServerPid, 4, 3),
    % 关闭跟踪
    erlang:trace(all, false, [call, send, 'receive']).



%    Pid = my_tracer:start().
%    ServerPid = arithmetic_server:start().
%    erlang:trace(ServerPid, true, [call, send, 'receive', {tracer, Pid}]).
%    erlang:trace_pattern({arithmetic_server, '_', '_'}, [{'_', [], [{return_trace}]}], [local]).
%    arithmetic_server:multiply(ServerPid, 4, 3).
%    erlang:trace(all, false, [call, send, 'receive']).
