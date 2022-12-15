%%%-------------------------------------------------------------------
%% @doc nine9s public API
%% @end
%%%-------------------------------------------------------------------

-module(nine9s_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    nine9s_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
