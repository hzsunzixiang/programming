%%%-------------------------------------------------------------------
%% @doc gen_event_rebar3 public API
%% @end
%%%-------------------------------------------------------------------

-module(gen_event_rebar3_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    gen_event_rebar3_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
