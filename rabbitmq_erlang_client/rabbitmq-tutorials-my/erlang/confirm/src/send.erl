-module(send).
-include_lib("amqp_client/include/amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

main() ->
    {ok, Connection} =
        amqp_connection:start(#amqp_params_network{host = "localhost"}),
    {ok, Channel} = amqp_connection:open_channel(Connection),

    amqp_channel:call(Channel, #'queue.declare'{queue = <<"hello">>}),
    %amqp_channel:call(Channel, #'confirm.select'{queue = <<"hello">>}), %  field queue undefined in record 'confirm.select'
    amqp_channel:call(Channel, #'confirm.select'{}), % 

    amqp_channel:cast(Channel,
                      #'basic.publish'{
                         exchange = <<"">>,
                         routing_key = <<"hello">>},
                      #amqp_msg{payload = <<"Hello World!">>}),
    io:format(" [x] Sent 'Hello World!'~n"),

	Result = amqp_channel:wait_for_confirms_or_die(Channel, 5000),
    ok = amqp_channel:close(Channel),
    ok = amqp_connection:close(Connection),
    ok.

%#!/usr/bin/env escript
%%! -pz ./_build/default/lib/amqp_client/ebin ./_build/default/lib/credentials_obfuscation/ebin ./_build/default/lib/jsx/ebin ./_build/default/lib/rabbit_common/ebin ./_build/default/lib/recon/ebin
%1> send:main().
% [x] Sent 'Hello World!'
%** exception throw: not_in_confirm_mode
%     in function  amqp_channel:do_wait_for_confirms/2 (amqp_channel.erl, line 979)
%     in call from amqp_channel:wait_for_confirms_or_die/2 (amqp_channel.erl, line 264)
%     in call from send:main/0 (/home/ericksun/programming/rabbitmq_erlang_client/rabbitmq-tutorials-my/erlang/confirm/src/send.erl, line 19)

