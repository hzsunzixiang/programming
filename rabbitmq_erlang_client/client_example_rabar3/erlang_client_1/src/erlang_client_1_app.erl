%%%-------------------------------------------------------------------
%% @doc erlang_client_1 public API
%% @end
%%%-------------------------------------------------------------------

-module(erlang_client_1_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    erlang_client_1_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
