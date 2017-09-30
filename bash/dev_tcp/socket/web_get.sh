#!/bin/bash
exec 3<> /dev/tcp/${1:-www.baidu.com}/80
 
printf "GET / HTTP/1.0\r\n" >&3
printf "Accept: text/html, text/plain\r\n" >&3
printf "Accept-Language: en\r\n" >&3
printf "User-Agent: nixCraft_BashScript v.%s\r\n" "${BASH_VERSION}"   >&3
printf "\r\n" >&3
 
while read LINE <&3
do
   # do something on $LINE
   # or send $LINE to grep or awk for grabbing data
   # or simply display back data with echo command
   echo $LINE
done
