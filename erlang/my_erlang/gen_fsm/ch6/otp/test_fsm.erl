-module(test_fsm).
-behaviour(gen_fsm).

-export([start_link/2, start/2]).

-export([init/1, state_name/2, state_name/3, handle_event/3,
	 handle_sync_event/4, handle_info/3, terminate/3, code_change/4]).

-record(state, {}).

start_link(TimerMs, Options) ->
    gen_fsm:start_link(?MODULE, TimerMs, Options).
start(TimerMs, Options) ->
    gen_fsm:start(?MODULE, TimerMs, Options).

init(0) ->
    {stop, stopped};
init(1) ->
    {next_state, selection, []};
init(TimerMs) ->
    timer:sleep(TimerMs),
    ignore.

state_name(_Event, State) ->
    {next_state, state_name, State}.

state_name(_Event, _From, State) ->
    Reply = ok,
    {reply, Reply, state_name, State}.

handle_event(_Event, StateName, State) ->
    {next_state, StateName, State}.

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    {reply, Reply, StateName, State}.

handle_info(_Info, StateName, State) ->
    {next_state, StateName, State}.

terminate(_Reason, _StateName, _State) ->
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.


start() ->
     test_fsm:start_link(0, []),
     test_fsm:start(0, []),
    'this is an end'.





%Erlang/OTP 21 [erts-10.2.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]
%
%Eshell V10.2.4  (abort with ^G)
%1> test_fsm:start_link(0, []).
%{error,stopped}
%=CRASH REPORT==== 10-Aug-2022::23:25:00.249190 ===
%  crasher:
%    initial call: test_fsm:init/1
%    pid: <0.79.0>
%    registered_name: []
%    exception exit: stopped
%      in function  gen_fsm:init_it/6 (gen_fsm.erl, line 361)
%    ancestors: [<0.77.0>]
%    message_queue_len: 0
%    messages: []
%    links: [<0.77.0>]
%    dictionary: []
%    trap_exit: false
%    status: running
%    heap_size: 376
%    stack_size: 27
%    reductions: 198
%  neighbours:
%    neighbour:
%      pid: <0.77.0>
%      registered_name: []
%      initial_call: {erlang,apply,2}
%      current_function: {io,execute_request,2}
%      ancestors: []
%      message_queue_len: 0
%      links: [<0.76.0>,<0.79.0>]
%      trap_exit: false
%      status: runnable
%      heap_size: 233
%      stack_size: 33
%      reductions: 1108
%      current_stacktrace: [{io,execute_request,2,[{file,"io.erl"},{line,581}]},
%                  {shell,enc,0,[{file,"shell.erl"},{line,1435}]},
%                  {shell,pp,4,[{file,"shell.erl"},{line,1422}]},
%                  {shell,exprs,7,[{file,"shell.erl"},{line,691}]},
%                  {shell,eval_exprs,7,[{file,"shell.erl"},{line,642}]},
%                  {shell,eval_loop,3,[{file,"shell.erl"},{line,627}]}]
%** exception error: stopped
%2> test_fsm:start(0, []).
%=CRASH REPORT==== 10-Aug-2022::23:25:34.409907 ===
%  crasher:
%    initial call: test_fsm:init/1
%    pid: <0.82.0>
%    registered_name: []
%    exception exit: stopped
%      in function  gen_fsm:init_it/6 (gen_fsm.erl, line 361)
%    ancestors: [<0.81.0>]
%    message_queue_len: 0
%    messages: []
%    links: []
%    dictionary: []
%    trap_exit: false
%    status: running
%    heap_size: 376
%    stack_size: 27
%    reductions: 182
%  neighbours:
%
%{error,stopped}

