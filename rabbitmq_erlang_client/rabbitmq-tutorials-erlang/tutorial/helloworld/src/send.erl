-module(send).
-compile([export_all]).
-compile(nowarn_export_all).
%-export([start/0]).

-include_lib("amqp_client/include/amqp_client.hrl").

% 连接
connect_amqp() ->
    %% Start a network connection
    RabbitParams=#amqp_params_network{},
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
    Declare = #'queue.declare'{ queue = <<"hello">> },
    #'queue.declare_ok'{queue = Q} = amqp_channel:call(Channel, Declare),
    io:format("amqp_channel:call queue.declare ok, return Q:~p~n", [Q]),
    Q.  % 这里的返回和声明一致，如果没有声明，则是一个随机的队列
publish_message(Channel, Q) ->
	%% -record('basic.publish', {ticket = 0, exchange = <<"">>, routing_key = <<"">>, mandatory = false, immediate = false}).
	% Here is an example of unrouteable message handling:
	Publish = #'basic.publish'{routing_key = Q},
    Msg = #amqp_msg{payload = <<"Hello World!">>},  % Props = #'P_basic'{delivery_mode = 2}, %% persistent message
    amqp_channel:cast(Channel, Publish, Msg),
    io:format("amqp_channel:cast basic.publish ok ~n"),
	ok.

start() ->
   Connection=send:connect_amqp(),
   Channel=send:open_channel(Connection),
   Q=send:declare_queue(Channel),
   send:publish_message(Channel, Q),
   ok = amqp_channel:close(Channel),
   ok = amqp_connection:close(Connection),
   "Finish".  
