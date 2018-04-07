

# 几种方式 aescrypt gpg openssl
# https://askubuntu.com/questions/60712/how-do-i-quickly-encrypt-a-file-with-aes
 aescrypt -e -p123456 ciphers.man 
 aescrypt -d -p123456  -o ciphers.man.1 ciphers.man.aes 




 gpg --cipher-algo AES256 -c ciphers.man
