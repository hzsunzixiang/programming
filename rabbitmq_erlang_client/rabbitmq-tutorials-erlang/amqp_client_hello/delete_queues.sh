#!/bin/bash

Vhost=vstation
User=vstation
Password=vstation
for i in `rabbitmqctl list_queues -p $Vhost |grep -v 'Timeout' |grep -v 'Listing' |grep -vw name  |awk '{print $1}'`
do
    echo "queu_name: $i"
    curl  -u $User:$Password -H "content-type:application/json"  -XDELETE http://localhost:15672/api/queues/$Vhost/$i
done 

