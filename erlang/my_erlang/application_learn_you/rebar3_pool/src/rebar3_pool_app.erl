%%%-------------------------------------------------------------------
%% @doc rebar3_pool public API
%% @end
%%%-------------------------------------------------------------------

-module(rebar3_pool_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    ppool_supersup:start_link().

stop(_State) ->
    ok.

%% internal functions
