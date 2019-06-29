

1. curl  https://www.ericksun.com/ 
不加 -k 选项
curl_secure.pcapng
Secure Sockets Layer
    TLSv1.2 Record Layer: Alert (Level: Fatal, Description: Unknown CA)
        Content Type: Alert (21)
        Version: TLS 1.2 (0x0303)
        Length: 2
        Alert Message
            Level: Fatal (2)
            Description: Unknown CA (48)





2.  curl  -k https://www.ericksun.com/
加 -k 选项
curl_no_secure.pcapng 

3.  加上--key选项，貌似没啥作用
curl_key.pcapng
curl -kv  --key  /home/ericksun/programming/cryptography/https-2/cert/ericksun_priv_key.key  https://www.ericksun.com/  
4.  加上--cert选项，貌似没啥作用
curl_cert.pcapng  
curl -kv -cert /home/ericksun/programming/cryptography/https-2/cert/mycert.crt  https://www.ericksun.com/  
5. 同时 加上--cert --key选项，貌似没啥作用
curl_cert_key.pcapng 

curl -kv  --key  /home/ericksun/programming/cryptography/https-2/cert/ericksun_priv_key.key -cert /home/ericksun/programming/cryptography/https-2/cert/mycert.crt  https://www.ericksun.com/  



# 用curl发送http请求
curl -k https://www.example.com:443



