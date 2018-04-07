

下载linux版本的aescrypt

https://www.aescrypt.com/download/v3/linux/aescrypt-3.13.tgz

然后 make&&make install 安装


# openssl 可以进行base64编码

# https://www.cnblogs.com/gordon0918/p/5317701.html
# 指定密码的输入方式，共有五种方式：命令行输入(stdin)、文件输入(file)、环境变量输入(var)、文件描述符输入(fd)、标准输入(stdin)。默认是标准输入，及从键盘输入。

#openssl enc -aes-128-cbc -in plain.txt -out out.txt -pass stdin 

# stdin表示从标准输入 输入密码
# 注意 每次生成的密文都不一样 因为默认是 -salt的
openssl enc -aes256 -in ciphers.man -out ciphers.man.aes256 -pass stdin 
或者
openssl enc -aes256 -in ciphers.man -out ciphers.man.aes256 -pass pass:123456 
openssl enc -aes256 -d -in ciphers.man.aes256 -pass stdin 
openssl enc -aes256 -d -in ciphers.man.aes256 -pass pass:123456 

# 有了 -nosalt 每次的密文是一样的
openssl enc -aes256 -nosalt -in ciphers.man -out ciphers.man.aes256.nosalt -pass stdin 
openssl enc -aes256 -nosalt -in ciphers.man -out ciphers.man.aes256.nosalt -pass pass:123456 

# 起等价形式为
openssl aes256 -nosalt -in ciphers.man -out ciphers.man.aes256.nosalt -pass stdin 
openssl aes256 -nosalt -in ciphers.man -out ciphers.man.aes256.nosalt -pass pass:123456 




/*对文件进行base64编码*/
openssl enc -base64 -in plain.txt -out base64.txt
/*对base64格式文件进行解密操作*/
openssl enc -base64 -d -in base64.txt -out plain2.txt
