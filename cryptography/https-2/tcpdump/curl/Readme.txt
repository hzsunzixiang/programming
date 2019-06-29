

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




# 用curl发送http请求
curl -k https://www.example.com:443
