%%%-------------------------------------------------------------------
%% @doc subscribe public API
%% @end
%%%-------------------------------------------------------------------

-module(subscribe_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    subscribe_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
