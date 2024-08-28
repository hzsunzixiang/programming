-module(amqp_delete_resource).

%-include_lib("amqp_client/include/amqp_client.hrl").
-include_lib("amqp_info.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

% 连接
connect_amqp() ->
    %% Start a network connection
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},
    %RabbitParams=#amqp_params_network{host="192.168.142.130", username=<<"vstation">>, password=<<"vstation">>, virtual_host=<<"vstation">>, port=5672},
    io:format("amqp_connection:start begin ~n"),
    {ok, Connection} = amqp_connection:start(RabbitParams),
    io:format("amqp_connection:start ok ~n"),
    Connection.

% 打开一个channel
open_channel(Connection) ->
    %% Open a channel on the connection
    io:format("amqp_connection:open_channel begin ~n"),
    {ok, Channel} = amqp_connection:open_channel(Connection),
    io:format("amqp_connection:open_channel ok ~n"),
    Channel.


% 清空队列
% -record('queue.purge', {ticket = 0, queue = <<"">>, nowait = false}).
% -record('queue.purge_ok', {message_count}).
purge_queue(Channel) ->
    Purge = #'queue.purge'{queue = ?QUEUE_NAME_CLASSIC}, 
    #'queue.purge_ok'{message_count=Count} = amqp_channel:call(Channel, Purge),
    io:format("amqp_channel:call queue.purge ok message_count:~p~n", [Count]),
    ok.
% 解绑队列
% -record('queue.unbind', {ticket = 0, queue = <<"">>, exchange, routing_key = <<"">>, arguments = []}).
% -record('queue.unbind_ok', {}).
unbind_queue(Channel) ->
    Unbind = #'queue.unbind'{queue = ?QUEUE_NAME_CLASSIC, exchange=?EXCHANGE, routing_key=?QUEUE_NAME_CLASSIC},
    #'queue.unbind_ok'{} = amqp_channel:call(Channel, Unbind),
    io:format("amqp_channel:call queue.unbind ok ~n"),
    ok.

% 删除队列
% -record('queue.delete', {ticket = 0, queue = <<"">>, if_unused = false, if_empty = false, nowait = false}).
% -record('queue.delete_ok', {message_count}).
delete_queue(Channel) ->
    Delete = #'queue.delete'{queue = ?QUEUE_NAME_CLASSIC}, 
    #'queue.delete_ok'{} = amqp_channel:call(Channel, Delete),
    io:format("amqp_channel:call queue.delete ok ~n"),
    ok.

% 删除 exchange
% -record('exchange.delete', {ticket = 0, exchange, if_unused = false, nowait = false}).
% -record('exchange.delete_ok', {}).
delete_exchange(Channel) ->
    Delete = #'exchange.delete'{exchange = ?EXCHANGE}, 
    #'exchange.delete_ok'{} = amqp_channel:call(Channel, Delete),
    io:format("amqp_channel:call exchange.delete ok ~n"),
    ok.

close_channel(Channel) ->
    % Close the channel
    amqp_channel:close(Channel),
    io:format("amqp_channel:close ok ~n"),
    ok.

close_connection(Connection) ->
    % Close the connection
    amqp_connection:close(Connection),
    io:format("amqp_connection:close ok ~n"),
    ok.


start() ->
   Connection=amqp_delete_resource:connect_amqp(),
   Channel=amqp_delete_resource:open_channel(Connection),
   amqp_delete_resource:purge_queue(Channel),
   amqp_delete_resource:unbind_queue(Channel),
   amqp_delete_resource:delete_queue(Channel),
   amqp_delete_resource:delete_exchange(Channel),
   amqp_delete_resource:close_channel(Channel),
   amqp_delete_resource:close_connection(Connection), 
   "Finish".  
