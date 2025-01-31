-module(amqp_confirm).
-include("amqp_info.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

main() ->
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},
    {ok, Connection} = amqp_connection:start(RabbitParams),
    {ok, Channel} = amqp_connection:open_channel(Connection),

    DeclareExchange = #'exchange.declare'{exchange = ?EXCHANGE, durable=true},
    #'exchange.declare_ok'{} = amqp_channel:call(Channel, DeclareExchange),

    DeclareQueue = #'queue.declare'{
      queue = ?QUEUE_NAME,   
      durable = true
    },
    #'queue.declare_ok'{queue = Q} = amqp_channel:call(Channel, DeclareQueue),
    io:format("return Q: ~p~n", [Q]),

    #'confirm.select_ok'{} = amqp_channel:call(Channel, #'confirm.select'{}), % 
    amqp_channel:register_confirm_handler(Channel, self()),

    Payload = <<"Hello World!">>,
	Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = Q},
	Props = #'P_basic'{delivery_mode = 2}, %% persistent message
    Msg = #amqp_msg{props = Props, payload = Payload},

    amqp_channel:cast(Channel, Publish, Msg),
    io:format(" [x] Sent 'Hello World!'~n"),


	confirm(Channel),

    {Connection,Channel}.

confirm(Channel) ->
	Result = amqp_channel:wait_for_confirms_or_die(Channel, 5000),
    io:format("wait_for_confirms_or_die,Result: ~p~n", [Result]),
    loop().

loop() ->
    receive
        #'basic.ack'{} ->
            io:format(" [x] Saw basic.ack~n");
        #'basic.nack'{} ->
            io:format(" [x] Saw basic.nack~n")
    end.
close({Connection, Channel}) ->
    ok = amqp_channel:close(Channel),
    ok = amqp_connection:close(Connection).

start_and_close() ->
   {Connection,Channel} = amqp_confirm:main(),
   close({Connection, Channel}),
   "Finish".

start() ->
   {Connection,Channel} = amqp_confirm:main(),
   "Finish".

%https://hexdocs.pm/amqp_client/
%register_confirm_handler/2
%register_confirm_handler(Channel, ConfirmHandler) -> ok
%
%Channel = pid()
%ConfirmHandler = pid()
%This registers a handler to deal with confirm-related messages. The registered process will receive #basic.ack{} and #basic.nack{} commands.

%#!/usr/bin/env escript
%%! -pz ./_build/default/lib/amqp_client/ebin ./_build/default/lib/credentials_obfuscation/ebin ./_build/default/lib/jsx/ebin ./_build/default/lib/rabbit_common/ebin ./_build/default/lib/recon/ebin
%1> send:main().
% [x] Sent 'Hello World!'
%** exception throw: not_in_confirm_mode
%     in function  amqp_channel:do_wait_for_confirms/2 (amqp_channel.erl, line 979)
%     in call from amqp_channel:wait_for_confirms_or_die/2 (amqp_channel.erl, line 264)
%     in call from send:main/0 (/home/ericksun/programming/rabbitmq_erlang_client/rabbitmq-tutorials-my/erlang/confirm/src/send.erl, line 19)

