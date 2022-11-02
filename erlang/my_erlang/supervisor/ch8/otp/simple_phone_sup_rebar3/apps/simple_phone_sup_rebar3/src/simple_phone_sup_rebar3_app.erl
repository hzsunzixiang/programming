%%%-------------------------------------------------------------------
%% @doc simple_phone_sup_rebar3 public API
%% @end
%%%-------------------------------------------------------------------

-module(simple_phone_sup_rebar3_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    simple_phone_sup_rebar3_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
