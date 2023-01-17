-module(amqp_tutorial).

%-include("amqp_client/include/amqp_client.hrl").
-include_lib("amqp_client/include/amqp_client.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

%-define(HOST, '192.168.142.130'). 
-define(HOST, "192.168.142.152"). 
%-define(HOST, "127.0.0.1"). 

% 不能用原子
%-define(RABBIT_USERNAME, vstation). 
%-define(RABBIT_PASSWORD, vstation). 
%-define(VHOST, vstation). 

% 这里必须是二进制
% 而且需要设置响应的权限 start_up.sh 脚本中有
-define(RABBIT_USERNAME, <<"vstation">>).
-define(RABBIT_PASSWORD, <<"vstation">>).
-define(VHOST, <<"vstation">>).

-define(EXCHANGE, <<"vstation">>). 
-define(QUEUE_NAME, 'FLOW'). 
-define(PORT, 5672). 
% exchange = 'vstation'
% vhost = 'vstation'
% user =  'vstation'
% password = 'vstation'
% queue_name =  'FLOW'

% The #amqp_params_network record sets the following default values:
% 
% Parameter	Default Value
% username	guest
% password	guest
% virtual_host	/
% host	localhost
% port	5672
% channel_max	2047
% frame_max	0
% heartbeat	0
% ssl_options	none
% auth_mechanisms	[fun amqp_auth_mechanisms:plain/3, fun amqp_auth_mechanisms:amqplain/3]
% client_properties	[]
% 定义在文件 amqp_client.hrl
%-record(amqp_params_network, {username           = <<"guest">>,
%                              password           = <<"guest">>,
%                              virtual_host       = <<"/">>,
%                              host               = "localhost",
%                              port               = undefined,
%                              channel_max        = 0,
%                              frame_max          = 0,
%                              heartbeat          = 10,
%                              connection_timeout = infinity,
%                              ssl_options        = none,
%                              auth_mechanisms    =
%                                  [fun amqp_auth_mechanisms:plain/3,
%                                   fun amqp_auth_mechanisms:amqplain/3],
%                              client_properties  = [],
%                              socket_options     = []}).

%%%%% 默认值介绍 抓包: 5672_1.pcap
% https://www.rabbitmq.com/erlang-client-user-guide.html
% Parameter	Default Value
% username	none
% password	none
% virtual_host	/
% node	node()
% client_properties	[]


% 从抓包看出默认值:virtual_host	/
% {ok, Connection} = amqp_connection:start(#amqp_params_network{}),
% Advanced Message Queueing Protocol
%     Type: Method (1)
%     Channel: 0
%     Length: 8
%     Class: Connection (10)
%     Method: Open (40)
%     Arguments
%         Virtual-Host: /
%         Capabilities: 
%         .... ...0 = Insist: False

% 设置密码
%Arguments
%    Virtual-Host: vstation
%    Capabilities: 
%    .... ...0 = Insist: False

test() ->
    %% Start a network connection
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},
    io:format("amqp_connection:start begin ~n"),
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{}),
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{host=?HOST}),
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{host=?HOST, port=?PORT}),
    {ok, Connection} = amqp_connection:start(RabbitParams),
    io:format("amqp_connection:start ok ~n"),

    %% Open a channel on the connection
    io:format("amqp_connection:open_channel begin ~n"),
    {ok, Channel} = amqp_connection:open_channel(Connection),
    io:format("amqp_connection:open_channel ok ~n"),

    %% Declare a queue
    % rabbit_framing.hrl:  -record('queue.declare_ok', {queue, message_count, consumer_count}).
    % rabbit_framing.hrl : -record('queue.declare', {ticket = 0, queue = <<"">>, passive = false, durable = false, exclusive = false, auto_delete = false, nowait = false, arguments = []}).
	% 默认情况下产生的队列, 命名方式如下
	% bash-4.2$ rabbitmqctl list_queues  -p vstation
	% Listing queues ...
	% amq.gen-4xcb2UGthrHBvdtPebCfTg  0
	% amq.gen-5pOP9ILyLfsYagbAUz1M5g  0
	% amq.gen-hS0ysJLAAHlJ2nZs3N85qw  0
	% amq.gen-qyLbZJEo-ciTsCpRtVfBuA  0
	% amq.gen-x9umQrijeAbVHxiC80f2pA  0
	%
    #'queue.declare_ok'{queue = Q} = amqp_channel:call(Channel, #'queue.declare'{}),

    %% Publish a message
    Payload = <<"foobar">>,
    Publish = #'basic.publish'{exchange = <<>>, routing_key = Q},
	%%Publish = #'basic.publish'{exchange = ?EXCHANGE, routing_key = ?QUEUE_NAME,
    %%                     mandatory = true},
	%% https://github.com/rabbitmq/rabbitmq-erlang-client/blob/master/src/amqp_channel.erl
    amqp_channel:cast(Channel, Publish, #amqp_msg{payload = Payload}),

    %% Poll for a message
    Get = #'basic.get'{queue = Q},
    {#'basic.get_ok'{delivery_tag = Tag}, Content}
         = amqp_channel:call(Channel, Get),

    %% Do something with the message payload
    %% (some work here)

    %% Ack the message
    amqp_channel:cast(Channel, #'basic.ack'{delivery_tag = Tag}),

    % Close the channel
    amqp_channel:close(Channel),
    % Close the connection
    amqp_connection:close(Connection),

    ok.

start_my() ->
   test(),
   io:format("very ok"),
   'this is an end'.

connect_amqp() ->
    %% Start a network connection
    RabbitParams=#amqp_params_network{host=?HOST, username=?RABBIT_USERNAME,
                      password=?RABBIT_PASSWORD, virtual_host=?VHOST, port=?PORT},
    io:format("amqp_connection:start begin ~n"),
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{}),
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{host=?HOST}),
    %{ok, Connection} = amqp_connection:start(#amqp_params_network{host=?HOST, port=?PORT}),
    {ok, Connection} = amqp_connection:start(RabbitParams),
    io:format("amqp_connection:start ok ~n").


