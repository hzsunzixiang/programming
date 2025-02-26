-module(amqp_publish).

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

% 声明一个exchange
declare_exchange(Channel) ->
    Declare = #'exchange.declare'{exchange = ?EXCHANGE, durable = true},
    %% Declare = #'exchange.declare'{exchange = ?EXCHANGE, type = <<"direct">>,}, %% type 默认值为 <<"direct">> 模式，一对一
	%% -record('exchange.declare', {ticket = 0, exchange, type = <<"direct">>, passive = false, durable = false, auto_delete = false, internal = false, nowait = false, arguments = []}).
	%%
    #'exchange.declare_ok'{} = amqp_channel:call(Channel, Declare),
    io:format("amqp_channel:call exchange.declare ok ~n"),
	ok.

% 声明一个队列
declare_queue(Channel) ->
    % 如果不写队列的名字，默认是这种, <<"amq.gen-tRkmLkwbpU3NxwaRMH0eAw">>
    Declare = #'queue.declare'{
      queue = ?QUEUE_NAME_CLASSIC,   % 这里是二进制
      durable = true
    },
    #'queue.declare_ok'{queue = Q} = amqp_channel:call(Channel, Declare),
    io:format("return Q: ~p~n", [Q]),
    io:format("amqp_channel:call queue.declare ok ~n"),
    Q.  % 这里的返回和声明一致，如果没有声明，则是一个随机的队列

delete_queue(Channel) ->
    Delete = #'queue.delete'{queue = ?QUEUE_NAME_CLASSIC}, 
    #'queue.delete_ok'{} = amqp_channel:call(Channel, Delete),
    io:format("amqp_channel:call queue.delete ok ~n"),
    ok.

% -record('queue.bind', {ticket = 0, queue = <<"">>, exchange, routing_key = <<"">>, nowait = false, arguments = []}).
% -record('queue.bind_ok', {}).
binding_queue(Q, Channel)->
    Binding = #'queue.bind'{queue       = Q,
                            exchange    = ?EXCHANGE,
                            routing_key = Q},  %%%% 这里有个routing_key bind 那个就发往哪个
    #'queue.bind_ok'{} = amqp_channel:call(Channel, Binding),
    io:format("amqp_channel:call queue.bind ok ~n"),
	ok.

publish_message(Channel, Q) ->
	%%Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = ?QUEUE_NAME_CLASSIC,
    %% Publish a message
    Payload = <<"foobar">>,
	% Here is an example of unrouteable message handling:
	%Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = Q, mandatory = true},
	Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = Q},
	Props = #'P_basic'{delivery_mode = 2}, %% persistent message
    Msg = #amqp_msg{props = Props, payload = Payload},
    amqp_channel:cast(Channel, Publish, Msg),
    io:format("amqp_channel:cast basic.publish ok ~n"),
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
   Connection=amqp_publish:connect_amqp(),
   Channel=amqp_publish:open_channel(Connection),
   amqp_publish:declare_exchange(Channel),
   Q=amqp_publish:declare_queue(Channel),
   amqp_publish:binding_queue(Q, Channel),
   amqp_publish:publish_message(Channel, Q),
   amqp_publish:close_channel(Channel),
   amqp_publish:close_connection(Connection), 
   "Finish".  
