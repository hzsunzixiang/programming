-module(rpc_client).
-export([start/1]).

-include_lib("amqp_client/include/amqp_client.hrl").

start(Argv) ->
    Num = case Argv of
             [] -> 10;
             [Arg] -> list_to_integer(Arg)
          end,
    io:format(" [x] Requesting fib(~p)~n", [Num]),
    Response = call(Num),
    io:format(" [.] Got ~p~n", [Response]),
    ok.

call(Num) ->
    {ok, Connection} =
        amqp_connection:start(#amqp_params_network{host = "localhost"}),
    {ok, Channel} = amqp_connection:open_channel(Connection),
    RequestQueue = <<"rpc_queue">>,
    %CorrelationId = uuid:get_v4(),
	CorrelationId = integer_to_binary(erlang:unique_integer()),

    amqp_channel:call(Channel, #'queue.declare'{queue = RequestQueue}),

    #'queue.declare_ok'{queue = ReplyQueue} =
        amqp_channel:call(Channel, #'queue.declare'{exclusive = true}),

    Method = #'basic.consume'{queue = ReplyQueue, no_ack = true},
    amqp_channel:subscribe(Channel, Method, self()),

    amqp_channel:cast(Channel,
                      #'basic.publish'{
                        exchange = <<>>,
                        routing_key = RequestQueue},
                      #amqp_msg{
                        payload = integer_to_binary(Num),
                        props = #'P_basic'{
                            reply_to = ReplyQueue,
                            correlation_id = CorrelationId}
                        }),
    
    Response = wait_for_messages(CorrelationId),

	%% 注释掉之后可以看到临时队列
    %%amqp_channel:close(Channel),
    %%amqp_connection:close(Connection),

    Response.

wait_for_messages(CorrelationId) ->
    receive
        {#'basic.deliver'{}, #amqp_msg{payload = Body, props = Props}} ->
            #'P_basic'{correlation_id = CorrId} = Props,
            if CorrelationId == CorrId ->
                binary_to_integer(Body);
            true ->
                -1
            end
    end.


%%Eshell V14.2.5.1 (press Ctrl+G to abort, type help(). for help)
%%(client@rabbitmq-1)1> rpc_client:start(["10"]).
%% [x] Requesting fib(10)
%% [.] Got 55
%%ok
%%(client@rabbitmq-1)2> rpc_client:start(["12"]).
%% [x] Requesting fib(12)
%% [.] Got 144
%%ok
