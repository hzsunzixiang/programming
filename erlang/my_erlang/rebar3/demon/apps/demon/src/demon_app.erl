%%%-------------------------------------------------------------------
%% @doc demon public API
%% @end
%%%-------------------------------------------------------------------

-module(demon_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    demon_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
