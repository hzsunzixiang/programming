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

if [ "$REQUEST_METHOD" = "POST" ]; then
    if [ "$CONTENT_LENGTH" -gt 0 ]; then
        read -n $CONTENT_LENGTH POST_DATA <&0
    fi
fi






echo ""   #  这一行必须得加 不然报错  这是由 http 协议决定的
echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Hello World</title>'
echo '</head>'
echo '<body>'
#echo 'Hello World'
echo "POST_DATA:$POST_DATA"
echo '</body>'
echo '</html>'
exit 0
