%%%-------------------------------------------------------------------
%% @doc amqp_rpc public API
%% @end
%%%-------------------------------------------------------------------

-module(amqp_rpc_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    amqp_rpc_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
