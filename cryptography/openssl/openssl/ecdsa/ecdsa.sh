openssl ecparam -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name prime256v1

openssl ecparam -genkey  -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name prime256v1

openssl ecparam -genkey  -param_enc explicit -conv_form uncompressed -text -noout -no_seed -name prime256v1 |openssl ec -text
