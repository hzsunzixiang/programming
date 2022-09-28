-module(frequency).
%-export([start/0, stop/0, allocate/0, deallocate/1]).
%-export([init/1, terminate/1, handle/2]).
-compile(export_all).
-compile(nowarn_export_all).

%% These are the start functions used to create and
%% initialize the server.
start_link() -> server:start(frequency, []).

init(_Args) ->
    {get_frequencies(), []}.

%% Hard-coded
get_frequencies() -> [10,11,12,13,14,15].

stop()	         -> server:stop(frequency).

allocate()	 -> server:call(frequency, {allocate, self()}).

deallocate(Freq) -> server:call(frequency, {deallocate, Freq}).

handle({allocate, Pid}, Frequencies) ->
    io:format("Frequencies:~p~n", [Frequencies]),
    allocate(Frequencies, Pid);

handle({deallocate, Freq}, Frequencies) ->
    {deallocate(Frequencies, Freq), ok}.

terminate(_Frequencies) ->
    io:format("call terminate ...... _Frequencies:~p ~n", [{_Frequencies}]),
    ok.

%% The Internal Helper Functions used to allocate and
%% deallocate frequencies.
allocate({[], Allocated}, _Pid) ->
    {{[], Allocated}, {error, no_frequency}};

allocate({[Freq|Free], Allocated}, Pid) ->
    {{Free, [{Freq, Pid}|Allocated]}, {ok, Freq}}.

deallocate({Free, Allocated}, Freq) ->
    NewAllocated=lists:keydelete(Freq, 1, Allocated),
    {[Freq|Free], NewAllocated}.

start() ->
    frequency:start_link(),
    {ok,Freq1}= frequency:allocate(),
    io:format("the Freq:: ~p~n",[Freq1]),
    {ok,Freq2}= frequency:allocate(),
    io:format("the Freq:: ~p~n",[Freq2]),
    {ok,Freq3}= frequency:allocate(),
    io:format("the Freq:: ~p~n",[Freq3]),
	frequency:deallocate(Freq2),
	frequency:stop(),
    'this is an end'.


% ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/ch3/call (master)$ erl
% Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]
% 
% Eshell V13.0.4  (abort with ^G)
% 1> frequency:start_link().
% true
% 2> frequency:start_link().
% ** exception error: bad argument
%      in function  register/2
%         called as register(frequency,<0.85.0>)
%         *** argument 1: name is in use
%      in call from server:start/2 (server.erl, line 6)
% 3> exit(whereis(frequency), kill).
% true
% 4> frequency:start_link().
% true

