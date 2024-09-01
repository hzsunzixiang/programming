-module(send).
-compile([export_all]).
-compile(nowarn_export_all).

-include_lib("amqp_client/include/amqp_client.hrl").

% 连接
connect_amqp() ->
    %% Start a network connection
    RabbitParams=#amqp_params_network{host = "localhost"},
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

% 声明一个队列
declare_queue(Channel) ->
    % 如果不写队列的名字，默认是这种, <<"amq.gen-tRkmLkwbpU3NxwaRMH0eAw">>
    Declare = #'queue.declare'{
      queue = <<"hello">>   % 这里是二进制
    },
    #'queue.declare_ok'{queue = Q} = amqp_channel:call(Channel, Declare),
    io:format("return Q: ~p~n", [Q]),
    io:format("amqp_channel:call queue.declare ok ~n"),
    Q.  % 这里的返回和声明一致，如果没有声明，则是一个随机的队列

publish_message(Channel, Q) ->
    %% Publish a message
	Publish = #'basic.publish'{exchange = <<"">>, routing_key = <<"hello">>},
    Payload = <<"Hello World">>,
    Msg = #amqp_msg{payload = Payload},
    amqp_channel:cast(Channel, Publish, Msg),
    io:format("amqp_channel:cast basic.publish ok ~n"),
	ok.

close_channel(Channel) ->
    % Close the channel
    amqp_channel:close(Channel),
    io:format("amqp_channel:close ok ~n"),
    ok.

close_connection(Connection) ->
    % Close the connection
    amqp_connection:close(Connection),
    io:format("amqp_connection:close ok ~n"),
    ok.

start() ->
   Connection=send:connect_amqp(),
   Channel=send:open_channel(Connection),
   Q=send:declare_queue(Channel),
   send:publish_message(Channel, Q),
   send:close_channel(Channel),
   send:close_connection(Connection), 
   "Finish".  

%%start() ->
%%    {ok, Connection} =
%%        amqp_connection:start(#amqp_params_network{host = "localhost", port=5672}),
%%    {ok, Channel} = amqp_connection:open_channel(Connection),
%%
%%    amqp_channel:call(Channel, #'queue.declare'{queue = <<"hello">>}),
%%
%%    amqp_channel:cast(Channel,
%%                      #'basic.publish'{
%%                         exchange = <<"">>,
%%                         routing_key = <<"hello">>},
%%                      #amqp_msg{payload = <<"Hello World!">>}),
%%    io:format(" [x] Sent 'Hello World!'~n"),
%%    ok = amqp_channel:close(Channel),
%%    ok = amqp_connection:close(Connection),
%%    ok.
