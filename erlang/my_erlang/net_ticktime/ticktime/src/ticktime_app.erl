%%%-------------------------------------------------------------------
%% @doc ticktime public API
%% @end
%%%-------------------------------------------------------------------

-module(ticktime_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    ticktime_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
