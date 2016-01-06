#!/bin/bash


#echo "Content-type: text/html"
echo "Content-type: text/html"



# http://paulturner.me/2009/07/reading-http-post-data-using-bash/
#  跟 submit_post.html 配套 

# from data 表单数据
# name:xxxxx
# likeProduct:yes
# comments:
# sub:Submit


#POST_DATA:name=xxxxx&likeProduct=yes&comments=afadfadaasf&sub=Submit

#if [ "$REQUEST_METHOD" = "POST" ]; then
#
#    if [ "$CONTENT_LENGTH" -gt 0 ]; then
#        read -n $CONTENT_LENGTH POST_DATA <&0
#    fi
#fi

# (internal) routine to store POST data function
cgi_get_POST_vars() { 
	# check content type 
	# FIXME: not sure if we could handle uploads with this.. 
	[ "${CONTENT_TYPE}" != "application/x-www-form-urlencoded" ] && \
		echo "Warning: you should probably use MIME type "\
		"application/x-www-form-urlencoded!" 1>&2 
	# save POST variables (only first time this is called) 
	[ -z "$QUERY_STRING_POST" \
		-a "$REQUEST_METHOD" = "POST" -a ! -z "$CONTENT_LENGTH" ] && \
		read -n $CONTENT_LENGTH QUERY_STRING_POST
		#QUERY_STRING_POST=$(</dev/stdin)
		#QUERY_STRING_POST=`cat /dev/stdin`
	echo "QUERY_STRING_POST++:$QUERY_STRING_POST"

}







echo ""   #  这一行必须得加 不然报错  这是由 http 协议决定的
echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Hello World</title>'
echo '</head>'
echo '<body>'
#echo 'Hello World'
#ENV=`env | tr ' ' '\r'`
ENV=`env`
echo "ENV:$ENV"
#echo "CONTENT_TYPE:${CONTENT_TYPE}"
#echo "POST_DATA:$POST_DATA"
echo `cgi_get_POST_vars`
echo '</body>'
echo '</html>'
exit 0



# <html>
# <head>
# <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
# <title>Hello World</title>
# </head>
# <body>
# ENV:SERVER_SIGNATURE=<address>Apache/2.2.22 (Debian) Server at 192.168.1.102 Port 80</address>
# 
# HTTP_USER_AGENT=Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36
# SERVER_PORT=80
# HTTP_ORIGIN=http://192.168.1.102
# HTTP_HOST=192.168.1.102
# DOCUMENT_ROOT=/var/www
# SCRIPT_FILENAME=/usr/lib/cgi-bin/shell/submit_post.sh
# REQUEST_URI=/cgi-bin/shell/submit_post.sh
# SCRIPT_NAME=/cgi-bin/shell/submit_post.sh
# HTTP_CONNECTION=keep-alive
# REMOTE_PORT=58557
# PATH=/usr/local/bin:/usr/bin:/bin
# PWD=/usr/lib/cgi-bin/shell
# SERVER_ADMIN=webmaster@localhost
# HTTP_ACCEPT_LANGUAGE=zh-CN,zh;q=0.8
# HTTP_REFERER=http://192.168.1.102/submit_post.html
# HTTP_ACCEPT=text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
# REMOTE_ADDR=192.168.1.100
# SHLVL=1
# SERVER_NAME=192.168.1.102
# CONTENT_LENGTH=51
# SERVER_SOFTWARE=Apache/2.2.22 (Debian)
# QUERY_STRING=
# SERVER_ADDR=192.168.1.102
# GATEWAY_INTERFACE=CGI/1.1
# HTTP_UPGRADE_INSECURE_REQUESTS=1
# SERVER_PROTOCOL=HTTP/1.1
# HTTP_ACCEPT_ENCODING=gzip, deflate
# HTTP_CACHE_CONTROL=max-age=0
# CONTENT_TYPE=application/x-www-form-urlencoded
# REQUEST_METHOD=POST
# _=/usr/bin/env
# QUERY_STRING_POST:name=xxxx&likeProduct=yes&comments=sssss&sub=Submit
# </body>
# </html>

# http://www.cgi101.com/book/ch3/text.html

# DOCUMENT_ROOT 	The root directory of your server
# HTTP_COOKIE 	The visitor's cookie, if one is set
# HTTP_HOST 	The hostname of the page being attempted
# HTTP_REFERER 	The URL of the page that called your program
# HTTP_USER_AGENT 	The browser type of the visitor
# HTTPS 	"on" if the program is being called through a secure server
# PATH 	The system path your server is running under
# QUERY_STRING 	The query string (see GET, below)
# REMOTE_ADDR 	The IP address of the visitor
# REMOTE_HOST 	The hostname of the visitor (if your server has reverse-name-lookups on; otherwise this is the IP address again)
# REMOTE_PORT 	The port the visitor is connected to on the web server
# REMOTE_USER 	The visitor's username (for .htaccess-protected pages)
# REQUEST_METHOD 	GET or POST
# REQUEST_URI 	The interpreted pathname of the requested document or CGI (relative to the document root)
# SCRIPT_FILENAME 	The full pathname of the current CGI
# SCRIPT_NAME 	The interpreted pathname of the current CGI (relative to the document root)
# SERVER_ADMIN 	The email address for your server's webmaster
# SERVER_NAME 	Your server's fully qualified domain name (e.g. www.cgi101.com)
# SERVER_PORT 	The port number your server is listening on
# SERVER_SOFTWARE 	The server software you're using (e.g. Apache 1.3) 
