%%%-------------------------------------------------------------------
%% @doc erlang_client_1 public API
%% @end
%%%-------------------------------------------------------------------

-module(erlang_client_1_app).

-behaviour(application).

-export([start/2, stop/1]).

-include("amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

%-define(HOST, '192.168.142.130'). 
-define(HOST, "192.168.142.130"). 
-define(RABBIT_USERNAME, vstation). 
-define(RABBIT_PASSWORD, vstation). 
-define(VHOST, vstation). 
-define(EXCHANGE, vstation). 
-define(QUEUE_NAME, 'FLOW'). 
-define(PORT, 5672). 

start(_StartType, _StartArgs) ->
    erlang_client_1_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
