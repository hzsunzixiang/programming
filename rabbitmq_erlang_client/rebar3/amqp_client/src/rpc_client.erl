-module(rpc_client).
-include("amqp_info.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

-define(QUEUE_NAME_RPC, <<"rpc_queue_amqp">>).

call(N) ->
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},
    {ok, Connection} = amqp_connection:start(RabbitParams),
	RpcClient = amqp_rpc_client:start_link(Connection, ?QUEUE_NAME_RPC), % -> RpcClient
	amqp_rpc_client:call(RpcClient, N), %-> ok
    ok.

main(Argv)->
    N = case Argv of
            [] ->
                <<"30">>;
            [R] ->
                list_to_binary(R)
        end,
    
    Result = rpc_client:call(N),
    Result.


%1> rpc_client:main(["20"]).
% [*] Waiting for rpc. To exit press CTRL+C
% [x] <<"amq.gen-Kgi1wvhdrm6cE3eUjYPlaw">>:<<"6765">>
%
%

% 这里接收响应，但是没有返回值，所以，无法获得来自服务端的响应

%_build/default/lib/amqp_client/src/amqp_rpc_client.erl
%
%%% Registers this RPC client instance as a consumer to handle rpc responses
%setup_consumer(#state{channel = Channel, reply_queue = Q}) ->
%    amqp_channel:call(Channel, #'basic.consume'{queue = Q}).
%
%%% @private
%handle_info({#'basic.deliver'{delivery_tag = DeliveryTag},
%             #amqp_msg{props = #'P_basic'{correlation_id = Id},
%                       payload = Payload}},
%            State = #state{continuations = Conts, channel = Channel}) ->
%    From = maps:get(Id, Conts),
%    gen_server:reply(From, Payload),
%    amqp_channel:call(Channel, #'basic.ack'{delivery_tag = DeliveryTag}),
%    {noreply, State#state{continuations = maps:remove(Id, Conts) }}.
%

