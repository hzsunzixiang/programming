#openssl ecparam -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name secp112r1
#openssl ecparam -name secp192k1 -genkey -out sony.key
#openssl req -new -x509 -nodes -days 365 -key sony.key -out sony.crt
#echo -n foo | ./openssl smime -sign -signer sony.crt -inkey sony.key -noattr -out foo.sig
#echo -n foo | openssl smime -sign -signer sony.crt -inkey sony.key -noattr -out foo.sig
#openssl smime -pk7out -in foo.sig -out foo.pk7
openssl genrsa -aes128 -out fd.key 2048
openssl rsa -text -in fd.key  >rsa_alg.txt
