-module(amqp_basic_return).

-include_lib("amqp_info.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

%The broker will return undeliverable messages back to the originating client. These are messages published either with the immediate or mandatory flags set. In order for the application to get notified of a return, it must register a callback process that can process #'basic.return'{} frames.

% 连接
connect_amqp() ->
    %% Start a network connection
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},
    %RabbitParams=#amqp_params_network{host="192.168.142.130", username=<<"vstation">>, password=<<"vstation">>, virtual_host=<<"vstation">>, port=5672},
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
    Declare = #'exchange.declare'{exchange = ?EXCHANGE, durable = true},
    %% Declare = #'exchange.declare'{exchange = ?EXCHANGE, type = <<"direct">>,}, %% type 默认值为 <<"direct">> 模式，一对一
	%% -record('exchange.declare', {ticket = 0, exchange, type = <<"direct">>, passive = false, durable = false, auto_delete = false, internal = false, nowait = false, arguments = []}).
    #'exchange.declare_ok'{} = amqp_channel:call(Channel, Declare),
    io:format("amqp_channel:call exchange.declare ok ~n"),
	ok.

% 声明一个队列
declare_queue(Channel) ->
    % 如果不写队列的名字，默认是这种, <<"amq.gen-tRkmLkwbpU3NxwaRMH0eAw">>
    Declare = #'queue.declare'{
      queue = ?QUEUE_NAME_CLASSIC,   % 这里是二进制
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

publish_message(Channel, Q) ->

    amqp_channel:register_return_handler(Channel, self()),
    %% Publish a message
    Payload = <<"foobar">>,
	% Here is an example of unrouteable message handling:
	Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = <<"not_exist">>, mandatory = true},
	Props = #'P_basic'{delivery_mode = 2}, %% persistent message
    Msg = #amqp_msg{props = Props, payload = Payload},

    amqp_channel:call(Channel, Publish, Msg),
    receive
        {BasicReturn, Content} ->
            %#'basic.return'{reply_text = <<"unroutable">>, exchange = X} = BasicReturn,
            #'basic.return'{reply_text = Y, exchange = X} = BasicReturn,
            %% Do something with the returned message
            io:format("receive, exchange:~p, reply_text:~p, Content:~p~n", [X, Y, Content#amqp_msg.payload])
			%%% receive, exchange:<<"vstation">>, reply_text:<<"NO_ROUTE">>, Content:<<"foobar">>
    end.

close_channel(Channel) ->
    % Close the channel
    amqp_channel:close(Channel).

close_connection(Connection) ->
    % Close the connection
    amqp_connection:close(Connection).


start() ->
   Connection=connect_amqp(),
   Channel=open_channel(Connection),
   declare_exchange(Channel),
   Q=declare_queue(Channel),
   binding_queue(Q, Channel),
   publish_message(Channel, Q),
   %close_channel(Channel),
   %close_connection(Connection),
   "Finish".

