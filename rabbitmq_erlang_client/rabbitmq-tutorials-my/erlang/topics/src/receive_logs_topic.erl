-module(receive_logs_topic).
-compile([export_all]).
-compile(nowarn_export_all).
-include_lib("amqp_client/include/amqp_client.hrl").

%1> receive_logs_topic:main(["kern.*"]).
% [*] Waiting for logs. To exit press CTRL+C
% [x] <<"kern.criticalA critical kernel error">>:<<"Hello World!">>
%

main(Argv) ->
    {ok, Connection} =
        amqp_connection:start(#amqp_params_network{host = "localhost"}),
    {ok, Channel} = amqp_connection:open_channel(Connection),

    amqp_channel:call(Channel, #'exchange.declare'{exchange = <<"topic_logs">>,
                                                   type = <<"topic">>}),

    #'queue.declare_ok'{queue = Queue} =
        amqp_channel:call(Channel, #'queue.declare'{exclusive = true}),

    [amqp_channel:call(Channel, #'queue.bind'{exchange = <<"topic_logs">>,
                                              routing_key = list_to_binary(BindingKey),
                                              queue = Queue})
     || BindingKey <- Argv],

    io:format(" [*] Waiting for logs. To exit press CTRL+C~n"),

    amqp_channel:subscribe(Channel, #'basic.consume'{queue = Queue,
                                                     no_ack = true}, self()),
    receive
        #'basic.consume_ok'{} -> ok
    end,
    loop(Channel).

loop(Channel) ->
    receive
        {#'basic.deliver'{routing_key = RoutingKey}, #amqp_msg{payload = Body}} ->
            io:format(" [x] ~p:~p~n", [RoutingKey, Body]),
            loop(Channel)
    end.
%#!/usr/bin/env escript
%%! -pz ./_build/default/lib/amqp_client/ebin ./_build/default/lib/credentials_obfuscation/ebin ./_build/default/lib/jsx/ebin ./_build/default/lib/rabbit_common/ebin ./_build/default/lib/recon/ebin 

