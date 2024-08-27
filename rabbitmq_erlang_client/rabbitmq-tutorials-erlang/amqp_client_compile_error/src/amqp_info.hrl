-ifndef(AMQP_INFO_HRL).
-define(AMQP_INFO_HRL, true).

-include_lib("amqp_client/include/amqp_client.hrl").

-define(HOST, "192.168.142.133"). 
% 这里必须是二进制  而且需要设置相应的权限 start_up.sh 脚本中有
-define(RABBIT_USERNAME, <<"vstation">>).
-define(RABBIT_PASSWORD, <<"vstation">>).
-define(VHOST, <<"vstation">>).
-define(EXCHANGE, <<"mirror_exchange_test">>). 
-define(QUEUE_NAME, <<"mirror_queue_test>>). 
-define(PORT, 5672). 
-define(NODE, 'rabbit@rabbitmq-1').

-endif.


