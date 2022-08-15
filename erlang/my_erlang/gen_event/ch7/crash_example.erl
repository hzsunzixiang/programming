-module(crash_example).
-behaviour(gen_event).
%-export([init/1, terminate/2, handle_event/2]).
-compile(export_all).
-compile(nowarn_export_all).

init(normal) -> {ok, []};
init(return) -> error;
init(ok)     -> ok;
init(crash) -> exit(crash).

terminate(_Reason, _LoopData) -> ok.

handle_event(crash,  _LoopData) -> 1/0;
handle_event(return, _LoopData) -> error.

start() ->
     {ok, P} = gen_event:start(),
     gen_event:which_handlers(P),
     gen_event:add_handler(P, crash_example, return),
     gen_event:which_handlers(P),
     gen_event:add_handler(P, crash_example, normal),
     gen_event:which_handlers(P),
     gen_event:notify(P, crash),
     gen_event:which_handlers(P),
     gen_event:add_handler(P, crash_example , normal),
     gen_event:notify(P, return),
     gen_event:which_handlers(P),
	 'this is an end'.


%Erlang/OTP 19 [erts-8.3.5.3] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]
%
%Eshell V8.3.5.3  (abort with ^G)
%1> {ok, P} = gen_event:start().
%{ok,<0.60.0>}
%2> gen_event:which_handlers(P).
%[]
%3> gen_event:add_handler(P, crash_example, return).
%error
%4>  gen_event:which_handlers(P).
%[]
%5> gen_event:add_handler(P, crash_example, normal).
%ok
%6> gen_event:which_handlers(P).
%[crash_example]
%7> gen_event:notify(P, crash).
%ok
%8>
%=ERROR REPORT==== 15-Aug-2022::06:08:28 ===
%** gen_event handler crash_example crashed.
%** Was installed in <0.60.0>
%** Last event was: crash
%** When handler state == []
%** Reason == {badarith,
%                 [{crash_example,handle_event,2,
%                      [{file,"crash_example.erl"},{line,14}]},
%                  {gen_event,server_update,4,
%                      [{file,"gen_event.erl"},{line,533}]},
%                  {gen_event,server_notify,4,
%                      [{file,"gen_event.erl"},{line,515}]},
%                  {gen_event,handle_msg,5,[{file,"gen_event.erl"},{line,256}]},
%                  {proc_lib,init_p_do_apply,3,
%                      [{file,"proc_lib.erl"},{line,247}]}]}
%
%8> gen_event:which_handlers(P)
%8> .
%[]
%9> gen_event:add_handler(P, crash_example , normal).
%ok
%10> gen_event:notify(P, return).
%
%=ERROR REPORT==== 15-Aug-2022::06:08:48 ===
%** gen_event handler crash_example crashed.
%** Was installed in <0.60.0>
%** Last event was: return
%** When handler state == []
%** Reason == error
%ok

