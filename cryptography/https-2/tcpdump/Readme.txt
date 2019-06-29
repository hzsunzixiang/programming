

1. 第一次请求，浏览器报错
https-chrome-certificate-key_exchange.pcapng
2. 添加例外之后请求
有发送证书和交换密钥的过程
https-chrome-certificate-after-exception.pcapng
3. 再次请求
无发送证书和交换密钥的过程
https-chrome-certificate-next-request.pcapng



# 用curl发送http请求
curl -k https://www.example.com:443
