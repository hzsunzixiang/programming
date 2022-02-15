-module(amqp_example_send).

-include("amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

-define(HOST, "127.0.0.1"). 

% 这里必须是二进制
% 而且需要设置响应的权限 start_up.sh 脚本中有
-define(RABBIT_USERNAME, <<"vstation">>).
-define(RABBIT_PASSWORD, <<"vstation">>).
-define(VHOST, <<"vstation">>).

-define(EXCHANGE, <<"vstation">>). 
-define(QUEUE_NAME, <<"FLOW">>). 
-define(PORT, 5672). 

test() ->
    %% Start a network connection
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},
    io:format("amqp_connection:start begin ~n"),
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{}),
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{host=?HOST}),
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{host=?HOST, port=?PORT}),
    {ok, Connection} = amqp_connection:start(RabbitParams),
    io:format("amqp_connection:start ok ~n"),

    %% Open a channel on the connection
    io:format("amqp_connection:open_channel begin ~n"),
    {ok, Channel} = amqp_connection:open_channel(Connection),
    io:format("amqp_connection:open_channel ok ~n"),

    %% Declare a queue
    % rabbit_framing.hrl:  -record('queue.declare_ok', {queue, message_count, consumer_count}).
    % rabbit_framing.hrl : -record('queue.declare', {ticket = 0, queue = <<"">>, passive = false, durable = false, exclusive = false, auto_delete = false, nowait = false, arguments = []}).

    %  creates an exchange
    DeclareExchange = #'exchange.declare'{exchange = ?EXCHANGE},
    #'exchange.declare_ok'{} = amqp_channel:call(Channel, DeclareExchange),
	
    % To declare a durable queue:
    Declare = #'queue.declare'{
      queue = ?QUEUE_NAME,
      durable = true
    },
    #'queue.declare_ok'{} = amqp_channel:call(Channel, Declare),

    % To create a routing rule from an exchange to a queue, the #'queue.bind'{} command is used:
    Binding = #'queue.bind'{queue       = ?QUEUE_NAME,
                            exchange    = ?EXCHANGE,
                            routing_key = ?QUEUE_NAME},
    #'queue.bind_ok'{} = amqp_channel:call(Channel, Binding),

    %% Publish a message
    Payload = <<"foobar">>,
    Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = ?QUEUE_NAME},
	%%Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = ?QUEUE_NAME,
    %%                     mandatory = true},
	%% https://github.com/rabbitmq/rabbitmq-erlang-client/blob/master/src/amqp_channel.erl
    %% amqp_client.hrl : -record(amqp_msg, {props = #'P_basic'{}, payload = <<>>}).
    %% https://www.rabbitmq.com/publishers.html#message-properties
    Props = #'P_basic'{delivery_mode = 2}, %% persistent message
    Msg = #amqp_msg{props = Props, payload = Payload},
    amqp_channel:cast(Channel, Publish, Msg),

    %%% 接收消息的流程 放到另外一个文件中
    %%% Poll for a message
    %Get = #'basic.get'{queue = ?QUEUE_NAME},
    %{#'basic.get_ok'{delivery_tag = Tag}, Content} = amqp_channel:call(Channel, Get),
    %#amqp_msg{payload = PayloadRec} = Content,
    %io:format("receive ok ~n~p", [PayloadRec]),

    %%% Do something with the message payload
    %%% (some work here)

    %%% Ack the message
    %amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}),

    % Close the channel
    amqp_channel:close(Channel),
    % Close the connection
    amqp_connection:close(Connection),

    ok.

start_my() ->
   test(),
   io:format("very ok"),
   'this is an end'.


