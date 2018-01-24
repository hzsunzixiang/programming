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

echo "AUTH_TYPE " $AUTH_TYPE
echo "<br>" 
echo "CONTENT_LENGTH " $CONTENT_LENGTH
echo "<br>" 
echo "CONTENT_TYPE " $CONTENT_TYPE 
echo "<br>" 
echo "GATEWAY_INTERFACE " $GATEWAY_INTERFACE
echo "<br>" 
echo "PATH_INFO " $PATH_INFO
echo "<br>" 
echo "PATH_TRANSLATED " $PATH_TRANSLATED
echo "<br>" 
echo "QUERY_STRING " $QUERY_STRING 
echo "<br>" 
echo "REMOTE_ADDR " $REMOTE_ADDR
echo "<br>" 
echo "REMOTE_HOST " $REMOTE_HOST
echo "<br>" 
echo "REMOTE_IDENT " $REMOTE_IDENT
echo "<br>" 
echo "REMOTE_USER " $REMOTE_USER
echo "<br>" 
echo "REQUEST_METHOD " $REQUEST_METHOD 
echo "<br>" 
echo "SCRIPT_NAME " $SCRIPT_NAME
echo "<br>" 
echo "SERVER_NAME " $SERVER_NAME
echo "<br>" 
echo "SERVER_PORT " $SERVER_PORT
echo "<br>" 
echo "SERVER_PROTOCOL " $SERVER_PROTOCOL
echo "<br>" 
echo "SERVER_SOFTWARE " $SERVER_SOFTWARE
echo "<br>" 
echo "</body></html>" 

# 请求 及结果
# http://192.168.56.101:8080/cgi-bin/example.sh?username=szx&whatToDo=play

#Here's what you said: You entered szx for username and wanted the action to be play 
#QUERY_STRING, username=szx&whatToDo=play 



#https://tools.ietf.org/html/rfc3875

# 以下是结果
# Here's what you said: You entered szx for username and wanted the action to be play 
# QUERY_STRING, username=szx&whatToDo=play pid: 26051 
# AUTH_TYPE 
# CONTENT_LENGTH 
# CONTENT_TYPE 
# GATEWAY_INTERFACE CGI/1.1 
# PATH_INFO 
# PATH_TRANSLATED 
# QUERY_STRING username=szx&whatToDo=play 
# REMOTE_ADDR 192.168.56.1 
# REMOTE_HOST 
# REMOTE_IDENT 
# REMOTE_USER 
# REQUEST_METHOD GET 
# SCRIPT_NAME /cgi-bin/example.sh 
# SERVER_NAME 192.168.56.101 
# SERVER_PORT 8080 
# SERVER_PROTOCOL HTTP/1.1 
# SERVER_SOFTWARE Apache/2.2.15 (CentOS) 
