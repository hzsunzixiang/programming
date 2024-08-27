-module(amqp_consumer_poll).

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
-define(PORT, 5672). 

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

% 这里不能循环
%in loop....** exception error: no match of right hand side value {'basic.get_empty',<<>>}
%     in function  amqp_consumer_poll:loop/2 (/home/ericksun/programming/rabbitmq_erlang_client/rebar3/amqp_client_hello/src/amqp_consumer_poll.erl, line 67)
get_message(Channel, Q) ->
    io:format("in loop...."),

    %% Poll for a message
    Get = #'basic.get'{queue = Q},
    {#'basic.get_ok'{delivery_tag = Tag}, Content} = amqp_channel:call(Channel, Get),
    
    %% Do something with the message payload
    %% (some work here)
    io:format("Tag:~p, Content:~p.~n", [Tag, Content#amqp_msg.payload]),
    
    %% Ack the message
    amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}).

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
   get_message(Channel, Q),
   %close_channel(Channel),
   %close_connection(Connection),
   "Finish".

