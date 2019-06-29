

使用 dss方式
生成密钥
ericksun@debian9-1:~/programming/cryptography/https-2/cert_dss$ openssl dsaparam  -out ericksun_priv_key.key -genkey 2048


生成CRT
openssl req -new -key ericksun_priv_key.key -out mycert.csr

openssl req -x509 -key ericksun_priv_key.key  -in mycert.csr -out mycert.crt


Handshake Protocol: Server Hello
    Handshake Type: Server Hello (2)
    Length: 101
    Version: TLS 1.2 (0x0303)
    Random
    Session ID Length: 32
    Session ID: 788b8411324144d503740937303f896050920f8060a3ee3d...
    Cipher Suite: TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 (0x00a3)
    Compression Method: null (0)
    Extensions Length: 29
    Extension: server_name
    Extension: renegotiation_info
    Extension: Heartbeat
    Extension: Application Layer Protocol Negotiation

可以找到  Cipher Suite:
    Cipher Suite: TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 (0x00a3)
