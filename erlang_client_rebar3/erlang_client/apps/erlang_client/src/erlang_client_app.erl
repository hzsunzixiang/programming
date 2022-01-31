%%%-------------------------------------------------------------------
%% @doc erlang_client public API
%% @end
%%%-------------------------------------------------------------------

-module(erlang_client_app).

-behaviour(application).

-include_lib("amqp_client/include/amqp_client.hrl").
-define(HOST, "192.168.142.130"). 
-define(RABBIT_USERNAME, vstation). 
-define(RABBIT_PASSWORD, vstation). 
-define(VHOST, vstation). 
-define(EXCHANGE, vstation). 
-define(QUEUE_NAME, 'FLOW'). 
-define(PORT, 5672). 

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},    
    {ok, Connection} = amqp_connection:start(RabbitParams),
    {ok, Channel} = amqp_connection:open_channel(Connection),
    erlang_client_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
