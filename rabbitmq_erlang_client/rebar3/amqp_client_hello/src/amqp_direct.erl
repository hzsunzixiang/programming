-module(amqp_direct).

%-include("amqp_client/include/amqp_client.hrl").
-include_lib("amqp_client/include/amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

-define(HOST, "192.168.142.130"). 


% 这里必须是二进制
% 而且需要设置相应的权限 start_up.sh 脚本中有
-define(RABBIT_USERNAME, <<"vstation">>).
-define(RABBIT_PASSWORD, <<"vstation">>).
-define(VHOST, <<"vstation">>).
-define(EXCHANGE, <<"vstation">>). 
-define(QUEUE_NAME, <<"FLOW">>). 
-define(NODE, 'rabbit@centos7-mq'). 

% 连接
%-record(amqp_params_direct, {username          = none,
%                             password          = none,
%                             virtual_host      = <<"/">>,
%                             node              = node(),
%                             adapter_info      = none,
%                             client_properties = []}).
connect_amqp() ->
    %% Start a network connection
    RabbitParams=#amqp_params_direct{virtual_host=?VHOST, node=?NODE},
    %RabbitParams=#amqp_params_direct{virtual_host="192.168.142.130", node='rabbit@centos7-mq'},
    %RabbitParams=#amqp_params_direct{username=?RABBIT_USERNAME,
    %                  password=?RABBIT_PASSWORD, virtual_host=?VHOST, node='rabbit@centos7-mq'},
    io:format("amqp_connection:start begin ~n"),
    Connection = amqp_connection:start(RabbitParams),
    io:format("amqp_connection:start result: ~p~n", [Connection]),
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
	%%Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = ?QUEUE_NAME,
	%
    % 如果不写队列的名字，默认是这种, <<"amq.gen-tRkmLkwbpU3NxwaRMH0eAw">>
    Declare = #'queue.declare'{
      queue = ?QUEUE_NAME,   % 这里是二进制
      durable = true
    },
    #'queue.declare_ok'{queue = Q} = amqp_channel:call(Channel, Declare),
    io:format("return Q: ~p~n", [Q]),
    Q.  % 这里的返回和声明一致，如果没有声明，则是一个随机的队列

publish_message(Channel, Q) ->
    %% Publish a message
    Payload = <<"foobar">>,
	Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = Q, mandatory = true},
    amqp_channel:cast(Channel, Publish, #amqp_msg{payload = Payload}),

    Binding = #'queue.bind'{queue       = Q,
                            exchange    = ?EXCHANGE,
                            routing_key = ?EXCHANGE},
    #'queue.bind_ok'{} = amqp_channel:call(Channel, Binding),

    %% Poll for a message
    Get = #'basic.get'{queue = Q},
    {#'basic.get_ok'{delivery_tag = Tag}, Content}
         = amqp_channel:call(Channel, Get),

    %% Do something with the message payload
    %% (some work here)

    %% Ack the message
    amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}).

close_channel(Channel) ->
    % Close the channel
    amqp_channel:close(Channel).

close_connection(Connection) ->
    % Close the connection
    amqp_connection:close(Connection).


start() ->
   amqp_direct:connect_amqp(),
   %Channel=amqp_example:open_channel(Connection),
   %Q=amqp_example:declare_queue(Channel),
   %publish_message(Channel, Q),
   %close_channel(Channel),
   %close_connection(Connection),
   "Finish".

