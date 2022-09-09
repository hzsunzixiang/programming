%%%-------------------------------------------------------------------
%% @doc bsc public API
%% @end
%%%-------------------------------------------------------------------

-module(bsc_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    bsc_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
