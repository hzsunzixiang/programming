%%%-------------------------------------------------------------------
%% @doc redbug_debug public API
%% @end
%%%-------------------------------------------------------------------

-module(redbug_debug_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    redbug_debug_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
