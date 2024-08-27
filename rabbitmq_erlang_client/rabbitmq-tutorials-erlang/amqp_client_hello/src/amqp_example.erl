-module(amqp_example).
%-include("amqp_client/include/amqp_client.hrl").
-include_lib("amqp_info.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

% 连接
connect_amqp() ->
    %% Start a network connection
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT, heartbeat=0},
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
    Declare = #'exchange.declare'{exchange = ?EXCHANGE},
    #'exchange.declare_ok'{} = amqp_channel:call(Channel, Declare).

% 声明一个队列
declare_queue(Channel) ->
    % 如果不写队列的名字，默认是这种, <<"amq.gen-tRkmLkwbpU3NxwaRMH0eAw">>
    Declare = #'queue.declare'{
      queue = ?QUEUE_NAME,   % 这里是二进制
      durable = true
    },
    #'queue.declare_ok'{queue = Q} = amqp_channel:call(Channel, Declare),
    io:format("return Q: ~p~n", [Q]),
    Q.  % 这里的返回和声明一致，如果没有声明，则是一个随机的队列

binding_queue(Q, Channel)->
    Binding = #'queue.bind'{queue       = Q,
                            exchange    = ?EXCHANGE,
                            routing_key = Q},
    #'queue.bind_ok'{} = amqp_channel:call(Channel, Binding).

publish_message(Channel, Q) ->
	%%Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = ?QUEUE_NAME,
    %% Publish a message
    Payload = <<"foobar">>,
	Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = Q},
	%Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = Q, mandatory = true},
	Props = #'P_basic'{delivery_mode = 2}, %% persistent message
    Msg = #amqp_msg{props = Props, payload = Payload},
    amqp_channel:cast(Channel, Publish, Msg).

    %%% Poll for a message
    %Get = #'basic.get'{queue = Q},
    %{#'basic.get_ok'{delivery_tag = Tag}, Content}
    %     = amqp_channel:call(Channel, Get),

    %%% Do something with the message payload
    %%% (some work here)

    %%% Ack the message
    %amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}).

close_channel(Channel) ->
    % Close the channel
    amqp_channel:close(Channel).

close_connection(Connection) ->
    % Close the connection
    amqp_connection:close(Connection).


start() ->
   Connection=amqp_example:connect_amqp(),
   Channel=amqp_example:open_channel(Connection),
   amqp_example:declare_exchange(Channel),
   Q=amqp_example:declare_queue(Channel),
   amqp_example:binding_queue(Q, Channel),
   %publish_message(Channel, Q),
   %close_channel(Channel),
   %close_connection(Connection),
   "Finish".

