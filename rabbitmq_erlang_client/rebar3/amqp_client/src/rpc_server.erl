-module(rpc_server).
-include("amqp_info.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

-define(QUEUE_NAME_RPC, <<"rpc_queue_amqp">>).

%% You can use pattern matching in function arguments part
fib(0) -> 
    0; 
fib(1) -> 
    1;
fib(N) -> 
    fib(N-1) + fib(N-2). 


%Response = Fun(Payload),
%_build/default/lib/amqp_client/src/amqp_rpc_server.erl

main() ->
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},
    {ok, Connection} = amqp_connection:start(RabbitParams),

    FunCall = fun(PayLoad) -> Res = integer_to_binary(fib(binary_to_integer(PayLoad))), io:format("Res:~p~n", [Res]), Res end,
    amqp_rpc_server:start(Connection, ?QUEUE_NAME_RPC, FunCall). % -> RpcServer


%Eshell V13.0.4  (abort with ^G)
%1> ===> Booted amqp_rpc
%
%1> rpc_client:main(["21"]).
%ok
%
%1> rpc_server:main().
%<0.357.0>
%Res:<<"10946">>
%Res:<<"10946">>

