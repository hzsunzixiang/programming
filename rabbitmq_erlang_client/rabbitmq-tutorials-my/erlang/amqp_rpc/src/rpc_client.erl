-module(rpc_client).
-include_lib("amqp_client/include/amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

-define(QUEUE_NAME, <<"rpc_queue_amqp">>).

call(N) ->
    {ok, Connection} = amqp_connection:start(#amqp_params_network{host = "localhost"}),
	RpcClient = amqp_rpc_client:start_link(Connection, ?QUEUE_NAME), % -> RpcClient
	amqp_rpc_client:call(RpcClient, N), %-> ok
    ok.

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
