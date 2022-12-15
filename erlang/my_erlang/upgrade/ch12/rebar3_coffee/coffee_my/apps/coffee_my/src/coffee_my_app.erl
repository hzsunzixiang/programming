%%%-------------------------------------------------------------------
%% @doc coffee_my public API
%% @end
%%%-------------------------------------------------------------------

-module(coffee_my_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    coffee_my_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
