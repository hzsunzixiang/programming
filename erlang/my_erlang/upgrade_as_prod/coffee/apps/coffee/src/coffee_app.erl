%%%-------------------------------------------------------------------
%% @doc coffee public API
%% @end
%%%-------------------------------------------------------------------

-module(coffee_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    coffee_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
