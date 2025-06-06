%%% @copyright (c) 2015-2016 Francesco Cesarini

-module(frequency).
-behaviour(gen_server).

%%-export([start/0, stop/0, allocate/0, deallocate/1]).
%%-export([init/1, handle_call/3, handle_cast/2, terminate/2, handle_info/2]).
%%-export([format_status/2]).
-compile(export_all).
-compile(nowarn_export_all).

%% CLIENT FUNCTIONS

%% start() -> {ok, pid()} | {error, Reason}
%% Starts the frequency server. Called by supervisor

start_link() ->
    gen_server:start_link({local, frequency}, frequency, [], []).

%% stop() -> ok.
%% Stops the frequency server.

stop() ->
    gen_server:cast(frequency, stop).


%% allocate() -> {ok, Frequency} | {error, no_resource}
%% If available, it returns a frequency used to make a call.
%% Frequency must be deallocated on termination.

allocate() ->
    gen_server:call(frequency, {allocate, self()}).

%% deallocate() -> ok
%% Frees a frequency so it can be used by another client.

deallocate(Frequency) ->
    gen_server:cast(frequency, {deallocate, Frequency}).


%% CALLBACK FUNCTIONS

%% init(_) -> {ok, State}
%% Initialises the generic server by getting the list of
%% available frequencies. [] is the list of allocated ones.

init(_Args) ->
    Frequencies = {get_frequencies(), []},
    {ok, Frequencies}.

%% Dummy function. To be replaced with call to BSC.

get_frequencies() -> [10,11,12,13,14, 15].


%% handle_call({allocate, Pid}, _, {Available, Allocated}) ->
%%     {reply, {ok, Frequency} | {error, no_resource}, {Available, Allocated}}
%% Callback for allocating resources.

handle_call({allocate, Pid}, _From, Frequencies) ->
    % Reply 就是下面所示的返回值 {ok, Res}
    {NewFrequencies, Reply} = allocate(Frequencies, Pid),
	% 这里的 Reply 返回给 call
    {reply, Reply, NewFrequencies}.


%% handle_cast({deallocate, Freq}, Frequencies) -> {noreply, NewFrequencies};
%% Callback for deallocating resources

handle_cast({deallocate, Freq}, Frequencies) ->
    NewFrequencies = deallocate(Frequencies, Freq),
    {noreply, NewFrequencies};

%% handle_cast(stop, LoopData) -> {stop, normal, LoopData}.
%% callback to stop the gen_server.

handle_cast(stop, LoopData) ->
    {stop, normal, LoopData}.

handle_info(_Msg, LoopData) ->
    {noreply, LoopData}.

%% terminate(Reason, LoopData) -> ok.
%% Termination callback. Does nothing, but should instead kill clients.

terminate(_Reason, _LoopData) ->
    io:format("call terminate ...... _LoopData:~p ~n", [{_Reason, _LoopData}]),
    ok.

format_status(_Opt, [_ProcDict, {Available, Allocated}]) ->
    {data, [{"State", {{available, Available}, {allocated, Allocated}}}]}.

%% INTERNAL FUNCTIONS

%% Helper functions used to allocate and deallocate resources.

allocate({[], Allocated}, _Pid) ->
    {{[], Allocated}, {error, no_frequency}};

% 这里返回 {ok, Res} 就是返回值
allocate({[Res|Resources], Allocated}, Pid) ->
    {{Resources, [{Res, Pid}|Allocated]}, {ok, Res}}.

deallocate({Free, Allocated}, Res) ->
    NewAllocated = lists:keydelete(Res, 1, Allocated),
    {[Res|Free],  NewAllocated}.


start() ->
    {ok,Pid} = frequency:start_link(),
	Pid ! <<"Test handle info">>,
    io:format("local,The Pid:: ~p~n",[Pid]),
    {ok,Freq1}= frequency:allocate(),
    io:format("the Freq:: ~p~n",[Freq1]),
    {ok,Freq2}= frequency:allocate(),
    io:format("the Freq:: ~p~n",[Freq2]),
    {ok,Freq3}= frequency:allocate(),
    io:format("the Freq:: ~p~n",[Freq3]),
	frequency:deallocate(Freq2),
	frequency:stop(),
    'this is an end'.
