for i in openssl-asn1parse openssl-ca openssl-ciphers openssl-cms openssl-crl openssl-crl2pkcs7 openssl-dgst openssl-dhparam openssl-dsa openssl-dsaparam openssl-ec openssl-ecparam openssl-enc openssl-engine openssl-errstr openssl-gendsa openssl-genpkey openssl-genrsa openssl-kdf openssl-list openssl-mac openssl-nseq openssl-ocsp openssl-passwd openssl-pkcs12 openssl-pkcs7 openssl-pkcs8 openssl-pkey openssl-pkeyparam openssl-pkeyutl openssl-prime openssl-rand openssl-rehash openssl-req openssl-rsa openssl-rsautl openssl-s_client openssl-s_server openssl-s_time openssl-sess_id openssl-smime openssl-speed openssl-spkac openssl-srp openssl-storeutl openssl-ts openssl-verify openssl-version openssl-x509 config crypto openssl-env  ssl x509v3_config
do
   man $i > $i.man
done
