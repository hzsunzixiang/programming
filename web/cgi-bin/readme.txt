
chmod 755 helloworld  # not chmod u+x 
curl localhost/cgi-bin/helloworld




****** 特别注意cgi-bin 是对apache来说的   ************  对nginx不适用
因为apache有独立的cgi模块
而nginx则不是这样的 另行研究
http://192.168.56.101:8080/cgi-bin/helloworld

云笔记中搜索  php-fpm配置  是用来配置apache的 fastcgi的


// 参看配置文件
stephensun@centos-1:~/programming/web/cgi-bin$ cp /etc/httpd/conf/httpd.conf .



# 注意配置文件中的这几行代码
Listen 8080
LoadModule cgi_module modules/mod_cgi.so
ScriptAlias /cgi-bin/ "/home/stephensun/programming/web/cgi-bin/"



这就是所谓的cgi 通用网关协议
