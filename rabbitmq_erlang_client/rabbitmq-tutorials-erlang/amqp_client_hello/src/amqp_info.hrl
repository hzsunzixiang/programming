
-ifndef(AMQP_INFO_HRL).
-define(AMQP_INFO_HRL, true).

-include_lib("amqp_client/include/amqp_client.hrl").

-define(HOST, "172.16.117.133"). 
-define(NODE, 'rabbit@rabbitmq-1'). 
% 这里必须是二进制  而且需要设置相应的权限 start_up.sh 脚本中有
-define(RABBIT_USERNAME, <<"vstation">>).
-define(RABBIT_PASSWORD, <<"vstation">>).
-define(VHOST, <<"vstation">>).
-define(EXCHANGE, <<"vstation">>). 
-define(QUEUE_NAME, <<"FLOW">>). 
-define(QUEUE_NAME_QUORUM, <<"FLOW_QUORUM">>). 
-define(QUEUE_NAME_CLASSIC, <<"FLOW_CLASSIC">>). 
-define(PORT, 5672). 


-endif.
