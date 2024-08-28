#!/bin/bash

Vhost=vstation
User=vstation
Password=vstation
Exchange=vstation
curl -i -u $User:$Password -H "content-type:application/json"  -XDELETE http://localhost:15672/api/exchanges/$Vhost/$Exchange

