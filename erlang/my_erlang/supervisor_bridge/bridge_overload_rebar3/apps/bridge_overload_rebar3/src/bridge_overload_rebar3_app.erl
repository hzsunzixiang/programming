%%%-------------------------------------------------------------------
%% @doc bridge_overload_rebar3 public API
%% @end
%%%-------------------------------------------------------------------

-module(bridge_overload_rebar3_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    bridge_overload_rebar3_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
