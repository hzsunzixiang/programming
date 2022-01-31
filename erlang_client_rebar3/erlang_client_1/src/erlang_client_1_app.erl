%%%-------------------------------------------------------------------
%% @doc erlang_client_1 public API
%% @end
%%%-------------------------------------------------------------------

-module(erlang_client_1_app).

-behaviour(application).

-export([start/2, stop/1]).

% https://rebar3.readme.io/discuss/550788db6ac1620d001b932a
% you should use -include_lib("epgsql/include/epgsql.hrl").	
-include_lib("amqp_client/include/amqp_client.hrl").

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

    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},    
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{}),
    {ok, Connection} = amqp_connection:start(RabbitParams),
    %% Open a channel on the connection
    {ok, Channel} = amqp_connection:open_channel(Connection),


    %erlang_client_1_sup:start_link().

	'this is an end'.
stop(_State) ->
    ok.

%% internal functions
%%

%-include_lib("cowlib/include/cow_inline.hrl").
%-include("amqp_client.hrl").
%-include_lib("proper/include/proper.hrl").
%-include_lib("amqp_client/include/amqp_client.hrl").
%../erlang_client_1/_build/default/lib/amqp_client/include/amqp_client.hrl
