%%%-------------------------------------------------------------------
%% @doc topics public API
%% @end
%%%-------------------------------------------------------------------

-module(topics_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    topics_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
