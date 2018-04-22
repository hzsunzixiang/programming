ericksun@debian:~/programming/linux/openssl/helloworld$ curl -x ""  -k   https://127.0.0.1:12345
<html><body><pre>GET / HTTP/1.1
Host: 127.0.0.1:12345
User-Agent: curl/7.52.1
Accept: */*

</pre></body></html>

ericksun@debian:~/programming/linux/openssl/helloworld$ ./ssl-client 127.0.0.1 12345
Connected with ECDHE-RSA-AES256-GCM-SHA384 encryption
Server certificates:
Subject: /C=CN/ST=ShenZhen/L=ShenZhen/O=TC/OU=CDG/CN=www.example.com/emailAddress=haichengsun123@163.com
Issuer: /C=CN/ST=ShenZhen/L=ShenZhen/O=TC/OU=CDG/CN=www.example.com/emailAddress=haichengsun123@163.com
Received: "<html><body><pre>Hello,wolrd</pre></body></html>

"

