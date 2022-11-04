%%%-------------------------------------------------------------------
%% @doc http_interface public API
%% @end
%%%-------------------------------------------------------------------

-module(http_interface_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    http_interface_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
