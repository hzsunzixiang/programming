-module(rpc_server).
-include_lib("amqp_client/include/amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

-define(QUEUE_NAME, <<"FLOW">>).

%% You can use pattern matching in function arguments part
fib(0) -> 
    0; 
fib(1) -> 
    1;
fib(N) -> 
    fib(N-1) + fib(N-2). 

main() ->
    {ok, Connection} =
        amqp_connection:start(#amqp_params_network{host = "localhost"}),
    {ok, Channel} = amqp_connection:open_channel(Connection),

    amqp_channel:call(Channel, #'queue.declare'{queue = ?QUEUE_NAME,
                                                durable = true}),
    io:format(" [*] Waiting for messages. To exit press CTRL+C~n"),

    amqp_channel:call(Channel, #'basic.qos'{prefetch_count = 1}),
    amqp_channel:subscribe(Channel, #'basic.consume'{queue = ?QUEUE_NAME}, self()),

    receive
        #'basic.consume_ok'{} -> ok
    end,
    loop(Channel),
    io:format("GOOD BYE~n").

loop(Channel) ->
    receive
        {#'basic.deliver'{delivery_tag = Tag}, #amqp_msg{props = Props, payload = Body}} ->
            #'P_basic'{correlation_id = CorrelationId,
                       reply_to = Q} = Props,
            io:format("Done [x] Received ~p~n", [Body]),
            Num = binary_to_integer(Body),
            Response = fib(Num),
            Properties = #'P_basic'{correlation_id = CorrelationId},
            Publish = #'basic.publish'{exchange = <<>>,
                                       routing_key = Q,
                                       mandatory = true},
            amqp_channel:call(Channel, Publish, #amqp_msg{props = Properties,
                                                          payload = integer_to_binary(Response)}),  %% 这里一定要是二进制
            amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}),  % 客户端声明的临时队列，需要ack
            loop(Channel)
    end.

%1> rpc_server:main().
% [*] Waiting for messages. To exit press CTRL+C
%Done [x] Received <<"25">>





