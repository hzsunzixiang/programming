-module(bsc).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    bsc_sup:start_link().


stop(_Data) ->
    ok.

%stop(Data) ->
%    io:format('Data:~p~n', [Data]),
%    ok.


%prep_stop(_State) -> 
%  'test_pre_stop'. 
%
%Module:prep_stop(State) -> NewState
%Types
%State = NewState = term()
%This function is called when an application is about to be stopped, before shutting down the processes of the application.
%
%State is the state returned from Module:start/2, or [] if no state was returned. NewState is any term and is passed to Module:stop/1.
%
%The function is optional. If it is not defined, the processes are terminated and then Module:stop(State) is called.
