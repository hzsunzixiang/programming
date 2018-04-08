

# 也可以这样获取 到签名二进制

# 这个显示所有信息
openssl asn1parse -in req_ca_sign.crt  


#从输出中看到最后一行 的 BIT STRING  就是签名部分
#  743:d=1  hl=4 l= 257 prim: BIT STRING        

# 743 分节
openssl asn1parse -in req_ca_sign.crt -out signature_crt1.bin -noout -strparse 743 

openssl rsautl -verify -inkey public_crt.key -in signature_crt1.bin -pubin  -out signature_crt_decrypted1.bin

# 这个取代上上面两步 可以直接看到签名 
#openssl rsautl -verify -inkey public_crt.key -in signature_crt.bin -asn1parse -pubin 
#openssl rsautl -verify -inkey public_crt.key -in signature_crt.bin -asn1parse -pubin
#    0:d=0  hl=2 l=  49 cons: SEQUENCE          
#    2:d=1  hl=2 l=  13 cons:  SEQUENCE          
#    4:d=2  hl=2 l=   9 prim:   OBJECT            :sha256
#   15:d=2  hl=2 l=   0 prim:   NULL              
#   17:d=1  hl=2 l=  32 prim:  OCTET STRING      
#      0000 - 1d b9 c0 af 90 95 66 4f-49 f6 68 f9 81 56 20 e1   ......fOI.h..V .
#      0010 - 82 f7 fe 90 53 b9 0c 30-0f 39 c1 1c 4c ff 53 99   ....S..0.9..L.S.

# 下面命令的输出
#openssl asn1parse -in req_ca_sign.crt  
#    0:d=0  hl=4 l=1000 cons: SEQUENCE          
#    4:d=1  hl=4 l= 720 cons: SEQUENCE          
#    8:d=2  hl=2 l=   3 cons: cont [ 0 ]        
#   10:d=3  hl=2 l=   1 prim: INTEGER           :02
#   13:d=2  hl=2 l=   9 prim: INTEGER           :BA2F47196368F88B
#   24:d=2  hl=2 l=  13 cons: SEQUENCE          
#   26:d=3  hl=2 l=   9 prim: OBJECT            :sha256WithRSAEncryption
#   37:d=3  hl=2 l=   0 prim: NULL              
#   39:d=2  hl=3 l= 136 cons: SEQUENCE          
#   42:d=3  hl=2 l=  11 cons: SET               
#   44:d=4  hl=2 l=   9 cons: SEQUENCE          
#   46:d=5  hl=2 l=   3 prim: OBJECT            :countryName
#   51:d=5  hl=2 l=   2 prim: PRINTABLESTRING   :CN
#   55:d=3  hl=2 l=  17 cons: SET               
#   57:d=4  hl=2 l=  15 cons: SEQUENCE          
#   59:d=5  hl=2 l=   3 prim: OBJECT            :stateOrProvinceName
#   64:d=5  hl=2 l=   8 prim: UTF8STRING        :ShenZhen
#   74:d=3  hl=2 l=  17 cons: SET               
#   76:d=4  hl=2 l=  15 cons: SEQUENCE          
#   78:d=5  hl=2 l=   3 prim: OBJECT            :localityName
#   83:d=5  hl=2 l=   8 prim: UTF8STRING        :ShenZhen
#   93:d=3  hl=2 l=  11 cons: SET               
#   95:d=4  hl=2 l=   9 cons: SEQUENCE          
#   97:d=5  hl=2 l=   3 prim: OBJECT            :organizationName
#  102:d=5  hl=2 l=   2 prim: UTF8STRING        :TC
#  106:d=3  hl=2 l=  12 cons: SET               
#  108:d=4  hl=2 l=  10 cons: SEQUENCE          
#  110:d=5  hl=2 l=   3 prim: OBJECT            :organizationalUnitName
#  115:d=5  hl=2 l=   3 prim: UTF8STRING        :CDG
#  120:d=3  hl=2 l=  24 cons: SET               
#  122:d=4  hl=2 l=  22 cons: SEQUENCE          
#  124:d=5  hl=2 l=   3 prim: OBJECT            :commonName
#  129:d=5  hl=2 l=  15 prim: UTF8STRING        :www.example.com
#  146:d=3  hl=2 l=  30 cons: SET               
#  148:d=4  hl=2 l=  28 cons: SEQUENCE          
#  150:d=5  hl=2 l=   9 prim: OBJECT            :emailAddress
#  161:d=5  hl=2 l=  15 prim: IA5STRING         :17842379@qq.com
#  178:d=2  hl=2 l=  30 cons: SEQUENCE          
#  180:d=3  hl=2 l=  13 prim: UTCTIME           :180419043104Z
#  195:d=3  hl=2 l=  13 prim: UTCTIME           :190419043104Z
#  210:d=2  hl=3 l= 136 cons: SEQUENCE          
#  213:d=3  hl=2 l=  11 cons: SET               
#  215:d=4  hl=2 l=   9 cons: SEQUENCE          
#  217:d=5  hl=2 l=   3 prim: OBJECT            :countryName
#  222:d=5  hl=2 l=   2 prim: PRINTABLESTRING   :CN
#  226:d=3  hl=2 l=  17 cons: SET               
#  228:d=4  hl=2 l=  15 cons: SEQUENCE          
#  230:d=5  hl=2 l=   3 prim: OBJECT            :stateOrProvinceName
#  235:d=5  hl=2 l=   8 prim: UTF8STRING        :ShenZhen
#  245:d=3  hl=2 l=  17 cons: SET               
#  247:d=4  hl=2 l=  15 cons: SEQUENCE          
#  249:d=5  hl=2 l=   3 prim: OBJECT            :localityName
#  254:d=5  hl=2 l=   8 prim: UTF8STRING        :ShenZhen
#  264:d=3  hl=2 l=  11 cons: SET               
#  266:d=4  hl=2 l=   9 cons: SEQUENCE          
#  268:d=5  hl=2 l=   3 prim: OBJECT            :organizationName
#  273:d=5  hl=2 l=   2 prim: UTF8STRING        :TC
#  277:d=3  hl=2 l=  12 cons: SET               
#  279:d=4  hl=2 l=  10 cons: SEQUENCE          
#  281:d=5  hl=2 l=   3 prim: OBJECT            :organizationalUnitName
#  286:d=5  hl=2 l=   3 prim: UTF8STRING        :CDG
#  291:d=3  hl=2 l=  24 cons: SET               
#  293:d=4  hl=2 l=  22 cons: SEQUENCE          
#  295:d=5  hl=2 l=   3 prim: OBJECT            :commonName
#  300:d=5  hl=2 l=  15 prim: UTF8STRING        :www.example.com
#  317:d=3  hl=2 l=  30 cons: SET               
#  319:d=4  hl=2 l=  28 cons: SEQUENCE          
#  321:d=5  hl=2 l=   9 prim: OBJECT            :emailAddress
#  332:d=5  hl=2 l=  15 prim: IA5STRING         :17842379@qq.com
#  349:d=2  hl=4 l= 290 cons: SEQUENCE          
#  353:d=3  hl=2 l=  13 cons: SEQUENCE          
#  355:d=4  hl=2 l=   9 prim: OBJECT            :rsaEncryption
#  366:d=4  hl=2 l=   0 prim: NULL              
#  368:d=3  hl=4 l= 271 prim: BIT STRING        
#  643:d=2  hl=2 l=  83 cons: cont [ 3 ]        
#  645:d=3  hl=2 l=  81 cons: SEQUENCE          
#  647:d=4  hl=2 l=  29 cons: SEQUENCE          
#  649:d=5  hl=2 l=   3 prim: OBJECT            :X509v3 Subject Key Identifier
#  654:d=5  hl=2 l=  22 prim: OCTET STRING      [HEX DUMP]:04142AEB1AADF41701F9561FB3EB3EE0CFDE3BC29D7B
#  678:d=4  hl=2 l=  31 cons: SEQUENCE          
#  680:d=5  hl=2 l=   3 prim: OBJECT            :X509v3 Authority Key Identifier
#  685:d=5  hl=2 l=  24 prim: OCTET STRING      [HEX DUMP]:301680142AEB1AADF41701F9561FB3EB3EE0CFDE3BC29D7B
#  711:d=4  hl=2 l=  15 cons: SEQUENCE          
#  713:d=5  hl=2 l=   3 prim: OBJECT            :X509v3 Basic Constraints
#  718:d=5  hl=2 l=   1 prim: BOOLEAN           :255
#  721:d=5  hl=2 l=   5 prim: OCTET STRING      [HEX DUMP]:30030101FF
#  728:d=1  hl=2 l=  13 cons: SEQUENCE          
#  730:d=2  hl=2 l=   9 prim: OBJECT            :sha256WithRSAEncryption
#  741:d=2  hl=2 l=   0 prim: NULL              
#  743:d=1  hl=4 l= 257 prim: BIT STRING        

#取代下面这两步
#SIGNATURE_HEX=$(openssl x509 -in req_ca_sign.crt -text -noout -certopt ca_default -certopt no_validity -certopt no_serial -certopt no_subject -certopt no_extensions -certopt no_signame | grep -v 'Signature Algorithm' | tr -d '[:space:]:')
#
#echo ${SIGNATURE_HEX} | xxd -r -p > signature_crt.bin
#
#openssl rsautl -verify -inkey public_crt.key -in signature_crt.bin -pubin  -out signature_crt_decrypted.bin
