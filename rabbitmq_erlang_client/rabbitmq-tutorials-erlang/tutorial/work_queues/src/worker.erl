-module(worker).
-compile([export_all]).
-compile(nowarn_export_all).
-include_lib("amqp_client/include/amqp_client.hrl").

main() ->
    {ok, Connection} =
        amqp_connection:start(#amqp_params_network{host = "localhost"}),
    {ok, Channel} = amqp_connection:open_channel(Connection),

    amqp_channel:call(Channel, #'queue.declare'{queue = <<"task_queue">>,
                                                durable = true}),
    io:format(" [*] Waiting for messages. To exit press CTRL+C~n"),

    amqp_channel:call(Channel, #'basic.qos'{prefetch_count = 1}),
    amqp_channel:subscribe(Channel, #'basic.consume'{queue = <<"task_queue">>},
                           self()),
    receive
        #'basic.consume_ok'{} -> ok
    end,
    loop(Channel),
    io:format("GOOD BYE~n").

loop(Channel) ->
    receive
        {#'basic.deliver'{delivery_tag = Tag}, #amqp_msg{payload = Body}} ->
            Dots = length([C || C <- binary_to_list(Body), C == $.]),
            io:format(" [x] Received ~p~n", [Body]),
            receive
            after
                Dots*1000 -> ok
            end,
            io:format(" [x] Done~n"),
            amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}),
            loop(Channel)
    end.
%#!/usr/bin/env escript
%%! -pz ./_build/default/lib/amqp_client/ebin ./_build/default/lib/credentials_obfuscation/ebin ./_build/default/lib/jsx/ebin ./_build/default/lib/rabbit_common/ebin ./_build/default/lib/recon/ebin

