-module(amqp_example).

-include("amqp_client.hrl").

-compile([export_all]).
-compile(nowarn_export_all).

-define(HOST, '192.168.142.130'). 
-define(RABBIT_USERNAME, vstation). 
-define(RABBIT_PASSWORD, vstation). 

test() ->
    %% Start a network connection
    RabbitParams=#amqp_params_network{host=?HOST,username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD},    
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{}),
    {ok, Connection} = amqp_connection:start(RabbitParams),
    %% Open a channel on the connection
    {ok, Channel} = amqp_connection:open_channel(Connection),

    %% Declare a queue
    #'queue.declare_ok'{queue = Q}
        = amqp_channel:call(Channel, #'queue.declare'{}),

    %% Publish a message
    Payload = <<"foobar">>,
    Publish = #'basic.publish'{exchange = <<>>, routing_key = Q},
    amqp_channel:cast(Channel, Publish, #amqp_msg{payload = Payload}),

    %% Poll for a message
    Get = #'basic.get'{queue = Q},
    {#'basic.get_ok'{delivery_tag = Tag}, Content}
         = amqp_channel:call(Channel, Get),

    %% Do something with the message payload
    %% (some work here)

    %% Ack the message
    amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}),

    %% Close the channel
    amqp_channel:close(Channel),
    %% Close the connection
    amqp_connection:close(Connection),

    ok.

start() ->
   test(),
   io:format("very ok"),
   'this is an end'.


