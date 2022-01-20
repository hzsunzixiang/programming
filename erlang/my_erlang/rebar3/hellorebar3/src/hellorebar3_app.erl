%%%-------------------------------------------------------------------
%% @doc hellorebar3 public API
%% @end
%%%-------------------------------------------------------------------

-module(hellorebar3_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    hellorebar3_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
