-module(timeout).
-behaviour(gen_server).

-export([init/1, handle_call/3]).

init(_Args) ->
    {ok, undefined}.

handle_call({sleep, Ms}, _From, LoopData) ->
    timer:sleep(Ms),
    {reply, ok, LoopData}.




%ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/ch4 (master)$ erl
%Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]
%
%Eshell V13.0.4  (abort with ^G)
%1>  gen_server:start_link({local,timeout}, timeout, [], []).
%{ok,<0.83.0>}
%2> self().
%<0.81.0>
%3> gen_server:call(timeout, {sleep, 1000}).
%ok
%4> self().
%<0.81.0>
%5> gen_server:call(timeout, {sleep, 5001}).
%** exception exit: {timeout,{gen_server,call,[timeout,{sleep,5001}]}}
%     in function  gen_server:call/2 (gen_server.erl, line 367)
%%% 崩溃之后客户端不存在了
%6> self().
%<0.88.0>
%7> gen_server:call(timeout, {sleep, 5001}).
%** exception exit: {noproc,{gen_server,call,[timeout,{sleep,5001}]}}
%     in function  gen_server:call/2 (gen_server.erl, line 367)
%8> flush().
%ok
%9> gen_server:call(timeout, {sleep, 5001}).
%** exception exit: {noproc,{gen_server,call,[timeout,{sleep,5001}]}}
%     in function  gen_server:call/2 (gen_server.erl, line 367)

% 如果是start，而不是start_link 则效果不同

% When you start behaviours in the shell, you link the shell process to them. If the shell
% process terminated abnormally, its EXIT signal will propagate to the behaviours it started
% and cause them to terminate. Generic servers can be started without linking them to
% their parent by calling gen_server:start/3 and gen_server:start/4. Use these functions
% with care, and preferably only for development and testing purposes, because
% behaviours should always be linked to their parent.
%ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/ch4 (master)$ erl
%Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]
%
%Eshell V13.0.4  (abort with ^G)
%1> gen_server:start({local,timeout}, timeout, [], []).
%{ok,<0.83.0>}
%2>  gen_server:call(timeout, {sleep, 1000}).
%ok
%3> gen_server:call(timeout, {sleep, 5001}).
%** exception exit: {timeout,{gen_server,call,[timeout,{sleep,5001}]}}
%     in function  gen_server:call/2 (gen_server.erl, line 367)
%4> gen_server:call(timeout, {sleep, 1000}).
%ok
%5> gen_server:call(timeout, {sleep, 5001}).
%** exception exit: {timeout,{gen_server,call,[timeout,{sleep,5001}]}}
%     in function  gen_server:call/2 (gen_server.erl, line 367)
%
