


#将"-text"和"-noout"结合使用，则只输出证书请求的文件头部分。


#       -noout
#           this option prevents output of the encoded version of the request.
openssl req -in req1.csr -noout -text




#-subject
#prints out the request subject (or certificate subject if -x509 is specified)

openssl req -in req1.csr -subject -noout

#也可以使用"-pubkey"输出证书请求文件中的公钥内容。如果从申请证书请求时所提供的私钥中提取出公钥，这两段公钥的内容是完全一致的。

#-pubkey
#outputs the public key.
openssl req -in req1.csr -pubkey -noout

openssl rsa -in pri_key.pem -pubout

