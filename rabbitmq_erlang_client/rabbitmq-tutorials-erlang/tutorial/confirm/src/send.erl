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
	%-record('confirm.select', {nowait = false}).
	%-record('confirm.select_ok', {}).
    #'consume_ok'{} = amqp_channel:call(Channel, #'confirm.select'{}), % 

    amqp_channel:cast(Channel,
                      #'basic.publish'{
                         exchange = <<"">>,
                         routing_key = <<"hello">>},
                      #amqp_msg{payload = <<"Hello World!">>}),
    io:format(" [x] Sent 'Hello World!'~n"),

    amqp_channel:register_confirm_handler(Channel, self()),

	Result = amqp_channel:wait_for_confirms_or_die(Channel, 5000),
    loop(Channel),
    ok = amqp_channel:close(Channel),
    ok = amqp_connection:close(Connection),
    ok.

loop(Channel) ->
    receive
        #'basic.ack'{} ->
            io:format(" [x] Saw basic.ack~n");
        #'basic.nack'{} ->
            io:format(" [x] Saw basic.nack~n")
    end.

%https://hexdocs.pm/amqp_client/
%register_confirm_handler/2
%register_confirm_handler(Channel, ConfirmHandler) -> ok
%
%Channel = pid()
%ConfirmHandler = pid()
%This registers a handler to deal with confirm-related messages. The registered process will receive #basic.ack{} and #basic.nack{} commands.

%1> send:main().
% [x] Sent 'Hello World!'
%** exception throw: not_in_confirm_mode
%     in function  amqp_channel:do_wait_for_confirms/2 (amqp_channel.erl, line 979)
%     in call from amqp_channel:wait_for_confirms_or_die/2 (amqp_channel.erl, line 264)
%     in call from send:main/0 (/home/ericksun/programming/rabbitmq_erlang_client/rabbitmq-tutorials-my/erlang/confirm/src/send.erl, line 19)



%%wait_for_confirms/1
%%wait_for_confirms(Channel) -> boolean() | timeout
%%
%%Channel = pid()
%%Wait until all messages published since the last call have been either ack'd or nack'd by the broker. Note, when called on a non-Confirm channel, waitForConfirms returns an error.
%%
%%wait_for_confirms/2
%%wait_for_confirms(Channel, Timeout) -> boolean() | timeout
%%
%%Channel = pid()
%%Timeout = non_neg_integer() | {non_neg_integer(), second | millisecond} | infinity
%%Wait until all messages published since the last call have been either ack'd or nack'd by the broker or the timeout expires. Note, when called on a non-Confirm channel, waitForConfirms throws an exception.
%%
%%wait_for_confirms_or_die/1
%%wait_for_confirms_or_die(Channel) -> true
%%
%%Channel = pid()
%%Behaves the same as wait_for_confirms/1, but if a nack is received, the calling process is immediately sent an exit(nack_received).
%%
%%wait_for_confirms_or_die/2
%%wait_for_confirms_or_die(Channel, Timeout) -> true
%%
%%Channel = pid()
%%Timeout = non_neg_integer() | {non_neg_integer(), second | millisecond} | infinity
%%Behaves the same as wait_for_confirms/1, but if a nack is received, the calling process is immediately sent an exit(nack_received). If the timeout expires, the calling process is sent an exit(timeout).


