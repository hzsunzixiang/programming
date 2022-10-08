%%%-------------------------------------------------------------------
%% @doc proc_lib_mutex public API
%% @end
%%%-------------------------------------------------------------------

-module(proc_lib_mutex_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    proc_lib_mutex_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
