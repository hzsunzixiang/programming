#!/bin/bash

LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")
echo "[$LOGTIME] startup run..." >>/root/startup_run.log
service ssh start >>/root/startup_run.log
#service mysql start >>/root/startup_run.log


#### rabbitmq
rabbitmq-server &

echo "will sleep 5 second, please wait........................."
sleep 5 
rabbitmqctl list_users
rabbitmqctl add_user vstation vstation
rabbitmqctl set_user_tags vstation administrator
rabbitmqctl list_users

rabbitmqctl add_vhost vstation
rabbitmqctl set_permissions -p vstation vstation ".*" ".*" ".*"
rabbitmqctl list_vhosts

rabbitmq-plugins enable rabbitmq_management
