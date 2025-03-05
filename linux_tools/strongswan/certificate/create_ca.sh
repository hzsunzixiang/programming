#!/bin/bash

private_key_file_for_ca=strongswanKey.pem
ca_file=strongswanCert.pem
swanctl_dir=/etc/strongswan/swanctl/
swanctl_conf_dir=$swanctl_dir/conf.d/

private_key_file_for_end_ca=moonKey.pem
end_ca_request_file=moonReq.pem
end_ca_file=moonCert.pem
domain_name_for_ca=moon.strongswan.org

#key_type=ecdsa  #ed25519
#key_length=521
key_type=rsa
key_length=3072

#private_key_file_for_end_ca=sunKey.pem
#end_ca_request_file=sunReq.pem
#end_ca_file=sunCert.pem
#domain_name_for_ca=sun.strongswan.org


#################################
######## 生成  CA证书 ###########
#################################
function generate_ca_file()
{
    # 生成密钥（128位的elliptic Edwards-Curve的key）
    # generates an elliptic Edwards-Curve key with a cryptographic strength of 128 bits. Alternative key types are ecdsa, classic rsa and ed448.
    pki --gen  --size $key_length --type $key_type --outform pem > $private_key_file_for_ca
    #对应的公钥被打包成一个自签名的CA证书，有效期为10年（3652天）：
    #根据秘钥生成证书 用上述生成的秘钥中的公钥：$private_key_file_for_ca,打包成一个自签名的CA证书
    pki --self --ca --lifetime 3652 --in $private_key_file_for_ca \
               --dn "C=CH, O=strongSwan, CN=strongSwan Root CA" \
               --outform pem > $ca_file
}


#################################
######## 生成终端实体证书 ###########
#################################
function generate_end_ca_file()
{
    #生成终端实体证书
    #使用以下命令为host 生成Ed25519私钥：
    pki --gen --size $key_length --type $key_type --outform pem > $private_key_file_for_end_ca
    
    
    #接下来，使用以下命令创建PKCS#10证书请求：
    pki --req --type priv --in $private_key_file_for_end_ca \
        --dn "C=CH, O=strongSwan, CN=$domain_name_for_ca" \
        --san $domain_name_for_ca --outform pem > $end_ca_request_file
    
    #基于证书请求，CA使用以下命令签发签名的终端实体证书：
    
    pki --issue --cacert $ca_file --cakey $private_key_file_for_ca \
        --type pkcs10 --in $end_ca_request_file --serial 01 --lifetime 1826 \
        --outform pem > $end_ca_file
}


function put_file_to_directory()
{
    sudo cp $ca_file $swanctl_dir/x509ca
    sudo cp $end_ca_file $swanctl_dir/x509
    sudo cp $private_key_file_for_end_ca $swanctl_dir/private
}

function main()
{
    generate_ca_file
    generate_end_ca_file
    put_file_to_directory
    
    echo "######## ca file ##############"
    pki --print --in $ca_file
    echo "######## end ca file ##############"
    pki --print --in $end_ca_file
    sudo tree $swanctl_dir 
    rm -f $private_key_file_for_ca $private_key_file_for_end_ca $ca_file $end_ca_request_file  $end_ca_file
}

## 函数入口
main
