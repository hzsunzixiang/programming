#!/bin/bash

echo "Content-type: text/html"
echo ""


USERNAME=`echo "$QUERY_STRING" | sed -n 's/^.*username=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
WHATTODO=`echo "$QUERY_STRING" | sed -n 's/^.*whatToDo=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`

echo "<html><head><title>What You Said</title></head>"
echo "<body>Here's what you said:"
echo "You entered $USERNAME for username and wanted the action to be $WHATTODO"
echo "<br>" 
echo "QUERY_STRING", $QUERY_STRING
echo "pid: " $$
echo "</br>" 
echo "</body></html>" 

# 请求 及结果
# http://192.168.56.101:8080/cgi-bin/example.sh?username=szx&whatToDo=play

#Here's what you said: You entered szx for username and wanted the action to be play 
#QUERY_STRING, username=szx&whatToDo=play 
