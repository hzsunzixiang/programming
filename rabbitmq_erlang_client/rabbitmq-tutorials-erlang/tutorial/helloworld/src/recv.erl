-module(recv).
-export([start/0]).
%-compile([export_all]).
%-compile(nowarn_export_all).

-include_lib("amqp_client/include/amqp_client.hrl").

start() ->
    {ok, Connection} =
        amqp_connection:start(#amqp_params_network{host = "localhost", heartbeat = 30}),
    {ok, Channel} = amqp_connection:open_channel(Connection),

    amqp_channel:call(Channel, #'queue.declare'{queue = <<"hello">>}),
    io:format(" [*] Waiting for messages. To exit press CTRL+C~n"),

    Method = #'basic.consume'{queue = <<"hello">>, no_ack = true},
    amqp_channel:subscribe(Channel, Method, self()),
    loop(Channel).

loop(Channel) ->
    receive
        #'basic.consume_ok'{} ->
            io:format(" [x] Saw basic.consume_ok~n"),
            loop(Channel);
        {#'basic.deliver'{}, #amqp_msg{payload = Body}} ->
			% 这里也可以定义个回调处理函数
            io:format(" [x] Received ~p~n", [Body]),
            loop(Channel)
    end.
