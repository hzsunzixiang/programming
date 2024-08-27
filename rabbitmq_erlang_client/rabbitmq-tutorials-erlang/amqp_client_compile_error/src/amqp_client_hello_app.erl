%%%-------------------------------------------------------------------
%% @doc amqp_client_hello public API
%% @end
%%%-------------------------------------------------------------------

-module(amqp_client_hello_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    amqp_client_hello_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
