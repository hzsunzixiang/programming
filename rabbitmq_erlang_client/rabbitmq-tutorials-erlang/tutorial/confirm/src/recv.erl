-module(recv).
-include_lib("amqp_client/include/amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).


start() ->
    {ok, Connection} =
        amqp_connection:start(#amqp_params_network{host = "localhost", heartbeat = 30}),
    {ok, Channel} = amqp_connection:open_channel(Connection),

    amqp_channel:call(Channel, #'queue.declare'{queue = <<"hello">>}),
    io:format(" [*] Waiting for messages. To exit press CTRL+C~n"),

    %Method = #'basic.consume'{queue = <<"hello">>, no_ack = true},
    Method = #'basic.consume'{queue = <<"hello">>},
    amqp_channel:subscribe(Channel, Method, self()),
    loop(Channel).

loop(Channel) ->
    receive
        #'basic.consume_ok'{} ->
            io:format(" [x] Saw basic.consume_ok~n"),
            loop(Channel);
        {#'basic.deliver'{delivery_tag = Tag}, #amqp_msg{payload = Body}} ->
            io:format(" [x] Received ~p~n", [Body]),
            amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}),
            loop(Channel)
    end.
