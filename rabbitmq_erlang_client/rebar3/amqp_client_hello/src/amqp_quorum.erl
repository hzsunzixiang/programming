-module(amqp_quorum).

%-include("amqp_client/include/amqp_client.hrl").
-include_lib("amqp_info.hrl").
-compile([export_all]).
-compile(nowarn_export_all).

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
	% -record('queue.declare', {ticket = 0, queue = <<"">>, passive = false, durable = false, exclusive = false, auto_delete = false, nowait = false, arguments = []}).
	%
    % Arg = [{<<"x-queue-type">>,   longstr, <<"quorum">>}]
    % Arg = [{<<"x-queue-type">>,  <<"quorum">>}],  % error
    Arg = [{<<"x-queue-type">>, longstr, <<"quorum">>}],
    % Arg = [{<<"x-queue-type">>, binary, <<"quorum">>}], % error
    Declare = #'queue.declare'{
      queue = ?QUEUE_NAME,   % 这里是二进制
      durable = true,
	  arguments = Arg
    },
    #'queue.declare_ok'{queue = Q} = amqp_channel:call(Channel, Declare),
    io:format("return Q: ~p~n", [Q]),
    Q.  % 这里的返回和声明一致，如果没有声明，则是一个随机的队列

delete_queue(Channel) ->
    Delete = #'queue.delete'{queue = ?QUEUE_NAME}, 
    #'queue.delete_ok'{} = amqp_channel:call(Channel, Delete),
    ok.



binding_queue(Q, Channel)->
    Binding = #'queue.bind'{queue       = Q,
                            exchange    = ?EXCHANGE,
                            routing_key = Q},
    #'queue.bind_ok'{} = amqp_channel:call(Channel, Binding).


close_channel(Channel) ->
    % Close the channel
    amqp_channel:close(Channel).

close_connection(Connection) ->
    % Close the connection
    amqp_connection:close(Connection).


start() ->
   Connection=amqp_quorum:connect_amqp(),
   Channel=amqp_quorum:open_channel(Connection),
   amqp_quorum:declare_exchange(Channel),
   amqp_quorum:delete_queue(Channel),
   Q=amqp_quorum:declare_queue(Channel),
   amqp_quorum:binding_queue(Q, Channel),
   "Finish".


% Arg = [{<<"x-queue-type">>,   longstr, <<"quorum">>}]
%% 这个格式是这样的
%% table_field_to_binary({FName, T, V}) ->
%%     [short_string_to_binary(FName) | field_value_to_binary(T, V)].
%% 
%% field_value_to_binary(longstr,       V) -> [$S | long_string_to_binary(V)];
%% field_value_to_binary(signedint,     V) -> [$I, <<V:32/signed>>];
%% field_value_to_binary(decimal,       V) -> {Before, After} = V,
%%                                        [$D, Before, <<After:32>>];
%% field_value_to_binary(timestamp,     V) -> [$T, <<V:64>>];
%% field_value_to_binary(table,         V) -> [$F | table_to_binary(V)];
%% field_value_to_binary(array,         V) -> [$A | array_to_binary(V)];
%% field_value_to_binary(byte,          V) -> [$b, <<V:8/signed>>];
%% field_value_to_binary(double,        V) -> [$d, <<V:64/float>>];
%% field_value_to_binary(float,         V) -> [$f, <<V:32/float>>];
%% field_value_to_binary(long,          V) -> [$l, <<V:64/signed>>];
%% field_value_to_binary(short,         V) -> [$s, <<V:16/signed>>];
%% field_value_to_binary(bool,          V) -> [$t, if V -> 1; true -> 0 end];
%% field_value_to_binary(binary,        V) -> [$x | long_string_to_binary(V)];
%% field_value_to_binary(unsignedbyte,  V) -> [$B, <<V:8/unsigned>>];
%% field_value_to_binary(unsignedshort, V) -> [$u, <<V:16/unsigned>>];
%% field_value_to_binary(unsignedint,   V) -> [$i, <<V:32/unsigned>>];
%% field_value_to_binary(void,     _V) -> [$V].


ericksun@centos7-mq1:~/program/rabbitmq-server (ericksun/debug)$ rabbitmq-queues quorum_status --vhost vstation FLOW_QUORUM
warning: :logger has be set to :warn in config files, please use :warning instead
  (logger 1.15.0-dev) lib/logger/app.ex:92: Logger.App.add_elixir_handler/2
  (logger 1.15.0-dev) lib/logger/app.ex:26: Logger.App.start/2
  (kernel 8.4.2) application_master.erl:293: :application_master.start_it_old/4

Status of quorum queue FLOW_QUORUM on node rabbit@centos7-mq1 ...
┌────────────────────┬────────────┬───────────┬──────────────┬────────────────┬──────┬─────────────────┐
│ Node Name          │ Raft State │ Log Index │ Commit Index │ Snapshot Index │ Term │ Machine Version │
├────────────────────┼────────────┼───────────┼──────────────┼────────────────┼──────┼─────────────────┤
│ rabbit@centos7-mq1 │ leader     │ 2         │ 2            │ undefined      │ 1    │ 3               │
├────────────────────┼────────────┼───────────┼──────────────┼────────────────┼──────┼─────────────────┤
│ rabbit@centos7-mq2 │ follower   │ 2         │ 2            │ undefined      │ 1    │ 3               │
├────────────────────┼────────────┼───────────┼──────────────┼────────────────┼──────┼─────────────────┤
│ rabbit@centos7-mq3 │ follower   │ 2         │ 2            │ undefined      │ 1    │ 3               │
└────────────────────┴────────────┴───────────┴──────────────┴────────────────┴──────┴─────────────────┘

