%%%-------------------------------------------------------------------
%% @doc xprof_use_debug public API
%% @end
%%%-------------------------------------------------------------------

-module(xprof_use_debug_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    xprof_use_debug_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
