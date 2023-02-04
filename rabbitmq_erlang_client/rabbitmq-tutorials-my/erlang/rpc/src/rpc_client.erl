-module(rpc_client).
-include_lib("amqp_client/include/amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

-define(QUEUE_NAME, <<"rpc_queue">>).

call(N) ->
    {ok, Connection} = amqp_connection:start(#amqp_params_network{host = "localhost"}),
    {ok, Channel} = amqp_connection:open_channel(Connection),

    #'queue.declare_ok'{queue = Queue} = amqp_channel:call(Channel, #'queue.declare'{exclusive = true}),  % 这里没有 no_ack 标志位，是需要ack的

    CorrelationId = integer_to_binary(erlang:unique_integer()), 
	%Request = integer_to_list(N),

    %EncodedCorrelationId = base64:encode(<<CorrelationId:64>>), % 这个是格式是透明的
    Props = #'P_basic'{correlation_id = CorrelationId,
                       content_type = <<"application/octet-stream">>,
                       reply_to = Queue},
    Publish = #'basic.publish'{exchange = <<"">>, % 默认的exchange可以绑定任何队列，所以这里没有队列名字
                               routing_key = ?QUEUE_NAME,   % 默认和队列名相同
                               mandatory = true},
    %% 这里同步发送消息
    amqp_channel:call(Channel, Publish, #amqp_msg{props = Props,
                                                  payload = N}),

    %% 这里接收
    io:format(" [*] Waiting for rpc. To exit press CTRL+C~n"),

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

main(Argv)->
    N = case Argv of
            [] ->
                <<"30">>;
            [R] ->
                list_to_binary(R)
        end,
    
    rpc_client:call(N),
    ok.


%1> rpc_client:main(["20"]).
% [*] Waiting for rpc. To exit press CTRL+C
% [x] <<"amq.gen-Kgi1wvhdrm6cE3eUjYPlaw">>:<<"6765">>
%
