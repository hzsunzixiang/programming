生成CRT
openssl req -new -key ericksun_priv_key.key -out mycert.csr

openssl req -x509 -key ericksun_priv_key.key  -in mycert.csr -out mycert.crt


用到的加密套件
Cipher Suite: TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (0xc02b)

同时证书信息为
TLSv1.2 Record Layer: Handshake Protocol: Server Hello
    Content Type: Handshake (22)
    Version: TLS 1.2 (0x0303)
    Length: 113
    Handshake Protocol: Server Hello
        Handshake Type: Server Hello (2)
        Length: 109
        Version: TLS 1.2 (0x0303)
        Random
        Session ID Length: 32
        Session ID: c0c8f02e21a7409332557c2b9fc7307ac0ebc987fb2b6c92...
        Cipher Suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
        Compression Method: null (0)
        Extensions Length: 37
        Extension: server_name
        Extension: renegotiation_info
        Extension: ec_point_formats
        Extension: Heartbeat
        Extension: Application Layer Protocol Negotiation
		
查看 		 Cipher Suite:	
Cipher Suite: TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (0xc02c)
