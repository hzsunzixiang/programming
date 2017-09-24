#!/bin/bash 

exec 5<>/dev/tcp/www.baidu.com/80
echo -e "GET / HTTP/1.0\n" >&5
cat <&5
