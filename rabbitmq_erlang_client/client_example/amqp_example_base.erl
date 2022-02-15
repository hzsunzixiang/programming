-module(amqp_example_base).

-include("amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

test() ->
    io:format("amqp_connection:start begin ~n"),
    {ok, Connection} = amqp_connection:start(#amqp_params_network{}),
    io:format("amqp_connection:start ok ~n"),
    %% Open a channel on the connection
    io:format("amqp_connection:open_channel begin ~n"),
    {ok, Channel} = amqp_connection:open_channel(Connection),
    io:format("amqp_connection:open_channel ok ~n"),

    %% Declare a queue
    #'queue.declare_ok'{queue = Q}
        = amqp_channel:call(Channel, #'queue.declare'{}),

    %% Publish a message
    Payload = <<"foobar">>,
    Publish = #'basic.publish'{exchange = <<>>, routing_key = Q},
	%%Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = ?QUEUE_NAME,
    %%                     mandatory = true},
    amqp_channel:cast(Channel, Publish, #amqp_msg{payload = Payload}),

    %% Poll for a message
    Get = #'basic.get'{queue = Q},
    {#'basic.get_ok'{delivery_tag = Tag}, Content}
         = amqp_channel:call(Channel, Get),

    %% Do something with the message payload
    %% (some work here)

    %% Ack the message
    amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}),

    % Close the channel
    amqp_channel:close(Channel),
    % Close the connection
    amqp_connection:close(Connection),

    ok.

start_my() ->
   test(),
   io:format("very ok"),
   'this is an end'.


