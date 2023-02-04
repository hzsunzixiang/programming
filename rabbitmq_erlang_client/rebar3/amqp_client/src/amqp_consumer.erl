-module(amqp_consumer).

-include("amqp_info.hrl").
%-include_lib("amqp_client/include/amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).


% 连接
connect_amqp() ->
    %% Start a network connection
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},
    io:format("amqp_connection:start begin ~n"),
    {ok, Connection} = amqp_connection:start(RabbitParams),
    io:format("amqp_connection:start ok ~n"),
    Connection.

% 打开一个channel
open_channel(Connection) ->
    %% Open a channel on the connection
    io:format("amqp_connection:open_channel begin ~n"),
    {ok, Channel} = amqp_connection:open_channel(Connection),
    io:format("amqp_connection:open_channel ok ~n"),
    Channel.

% 声明一个exchange
declare_exchange(Channel) ->
    Declare = #'exchange.declare'{exchange = ?EXCHANGE},
    #'exchange.declare_ok'{} = amqp_channel:call(Channel, Declare).

% 声明一个队列
declare_queue(Channel) ->
    % 如果不写队列的名字，默认是这种, <<"amq.gen-tRkmLkwbpU3NxwaRMH0eAw">>
    Declare = #'queue.declare'{
      queue = ?QUEUE_NAME,   % 这里是二进制
      durable = true
    },
    #'queue.declare_ok'{queue = Q} = amqp_channel:call(Channel, Declare),
    io:format("return Q: ~p~n", [Q]),
    Q.  % 这里的返回和声明一致，如果没有声明，则是一个随机的队列

binding_queue(Q, Channel)->
    Binding = #'queue.bind'{queue       = Q,
                            exchange    = ?EXCHANGE,
                            routing_key = ?EXCHANGE},
    #'queue.bind_ok'{} = amqp_channel:call(Channel, Binding).

consumer_message(Channel, Q) ->
    %process (`self()`),
    #'basic.consume_ok'{consumer_tag = Tag} = amqp_channel:subscribe(Channel, #'basic.consume'{queue = Q, no_ack = true}, self()),
    Tag.


loop(Channel, Tag) ->
    io:format("in loop....Tag: ~p, ~n", [Tag]),
    receive
        %% This is the first message received
        #'basic.consume_ok'{} ->
            %io:format("in basic.consume_ok....~n"),
            loop(Channel, Tag);

        %% This is received when the subscription is cancelled
        #'basic.cancel_ok'{} ->
            io:format("in basic.cancel_ok....~n"),
            ok;
%
%decode_method_fields('basic.deliver', <<F0Len:8/unsigned, F0:F0Len/binary, F1:64/unsigned, F2Bits:8, F3Len:8/unsigned, F3:F3Len/binary, F4Len:8/unsigned, F4:F4Len/binary>>) ->
%  F2 = ((F2Bits band 1) /= 0),
%  #'basic.deliver'{consumer_tag = F0, delivery_tag = F1, redelivered = F2, exchange = F3, routing_key = F4};
        %% A delivery
        %-record(amqp_msg, {props = #'P_basic'{}, payload = <<>>}).
        {#'basic.deliver'{delivery_tag = TagRet}, Content} ->
            io:format("in basic.deliver....~n"),
            %% Do something with the message payload
            %% (some work here)
            io:format("Tag:~p, TagRet:~p, Content:~p.~n", [Tag, TagRet, Content#amqp_msg.payload]),
            %% Ack the message
            %amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}),
            io:format("after ack .....~n"),

            %% Loop
            loop(Channel, Tag)
    end.


close_channel(Channel) ->
    % Close the channel
    amqp_channel:close(Channel).

close_connection(Connection) ->
    % Close the connection
    amqp_connection:close(Connection).


start() ->
   Connection = amqp_example:connect_amqp(),
   Channel = amqp_example:open_channel(Connection),
   amqp_example:declare_exchange(Channel),
   Q = amqp_example:declare_queue(Channel),
   binding_queue(Q, Channel),
   Tag = consumer_message(Channel, Q),
   io:format("Tag:~p~n", [Tag]),
   loop(Channel, Tag),
   %close_channel(Channel),
   %close_connection(Connection),
   "Finish".

